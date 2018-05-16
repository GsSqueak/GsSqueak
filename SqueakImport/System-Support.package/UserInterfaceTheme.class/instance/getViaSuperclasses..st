private
getViaSuperclasses: keyObject 
	"keyObject is intended to be an Association.
	Find the superclass of the key of the keyObject (which will initially be the client's class) and make a new keyObject using that and the original message name, then try searching for that."
		
	"We know we're the only referencer of keyObject.  Update it rather than create new ones, for performance reasons."
	keyObject key: keyObject key superclass.

	keyObject key ifNil: [^ nil].
	
	properties
		at: keyObject
		ifPresent: [:prop | ^ prop value].
	
	^ self getViaSuperclasses: keyObject