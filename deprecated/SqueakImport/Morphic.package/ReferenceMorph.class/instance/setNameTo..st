naming
setNameTo: aString 
	super setNameTo: aString.
	(submorphs notEmpty and: [submorphs first isKindOf: StringMorph]) 
		ifTrue: [submorphs first contents: aString]