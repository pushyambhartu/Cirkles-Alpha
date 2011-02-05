package cirkles.alpha
import java.security.MessageDigest

class User {

	String name
    String password
    String passwordConfirmation
	String salt
	Integer bookCount = 100
	Integer shelfCount = 10
    Date dateCreated = new Date()
    Date lastUpdated = new Date()

    static hasMany = [ shelfs: Shelf, books: Book]
	
	static belongsTo = [cirkle:Cirkle]

    static transients = [ 'passwordConfirmation' ]

    static constraints = {
        name(size: 1..40, blank: false, unique: true)
		password(maxSize: 40, nullable: false, validator: User.validatePassword)
		cirkle()
    }
    static mapping = {
        name index: 'users_name_index', unique: true
    }
	String toString() {
        "${name}"
    }
      
    static User authenticate(String name, String password) {
        User user = User.findByName(name)
        if (user) {
            if (user.password != encryptedPassword(user.salt, password)) {
                user = null
            }
        }
        user
    }

    private static validatePassword = { password, user ->
        if (!user.id) {
            user.salt = "--${System.currentTimeMillis().toString()}--${Math.random().toString()}--".encodeAsPassword()
            password = password?.trim()
            if (!password) {
                password = ""
            }
            if (password.length() < 6 || password.length() > 40) {
                user.errors.rejectValue('password', 'user.password.length',
                    ['password', 'User', password] as Object[], 
                    'Property [{0}] of class [{1}] must be between 6 and 40 characters')
            }
            else {
                user.password = encryptedPassword(user.salt, password)
            }
        }
        true
    }
    
    private static String encryptedPassword(salt, password) {
        "--${salt}--${password}--".encodeAsPassword()
    }
}
