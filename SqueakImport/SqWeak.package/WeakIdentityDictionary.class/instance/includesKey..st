testing
includesKey: key 
	"Answer whether the receiver has a key equal to the argument, key."
	
	(array at: (self scanFor: key))
		ifNil: [
			"it just has been reclaimed"
			^false]
		ifNotNil: [ :element |
			element == vacuum
				ifTrue: [ ^false ]
				ifFalse: [ ^true ] ]