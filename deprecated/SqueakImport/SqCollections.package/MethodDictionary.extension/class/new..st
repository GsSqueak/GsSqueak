*SqCollections-instance creation
new: numberOfElements
	"Create an instance large enough to hold numberOfElements methods without growing."
	
	^ self _env0 new: numberOfElements
