package cirkles.alpha

class Cirkle {
	String name
	String description
	String address
	Date dateCreated = new Date()
	Date lastUpdated = new Date()
	Boolean confirmDelete

	static hasMany = [ users: User]

	static optionals = [ 'description','address' ]

	static transients = [ 'confirmDelete' ]

	static constraints = {
		name(size: 1..100,blank: false)
	}

	static mapping = {
		name type: 'text'
		description type: 'text'
	}

	String toString() {
		"${name}"
	}
}
