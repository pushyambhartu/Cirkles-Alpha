package cirkles.alpha

class Book {
    String title
    String description
	String author
	Date dateCreated = new Date()
    Date lastUpdated = new Date()
    Boolean confirmDelete

    static belongsTo = [ user:User, shelf:Shelf ] 

    static optionals = [ 'description' ]

    static transients = [ 'confirmDelete' ]

    static constraints = {
        title(size: 1..100,blank: false)
		author(size: 1..40,blank: false)
		user()
		shelf()
    }

    static mapping = {
        title type: 'text'
		author type: 'text'
		description type: 'text'
    }

	String toString() {
		"${title}"
	}
}
