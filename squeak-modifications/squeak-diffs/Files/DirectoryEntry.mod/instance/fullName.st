access
fullName
	"The fully-qualified name.
	 Since this method falls into the equality test, make it safe when directory is nil."
	^ directory 
		ifNotNil: [ directory fullNameFor: self name ] 
		ifNil: [ self name ]