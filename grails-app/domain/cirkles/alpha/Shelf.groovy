package cirkles.alpha

class Shelf {
    User user
    String name
    String description
	Integer bookCount = 10
    Date dateCreated = new Date()
    Date lastUpdated = new Date()
    Boolean confirmDelete

    static belongsTo = [user:User]
    static hasMany = [ books : Book ]

    static transients = [ 'confirmDelete' ]

    static optionals = [ 'description' ]
  
    static constraints = {
        name(size: 1..40, blank: false)
        description()
		user()
    }

    static mapping = {
        description type: 'text'
        user index: 'albums_user_index', unique: false
    }

    String toString() {
        "${name}"
    }
}
