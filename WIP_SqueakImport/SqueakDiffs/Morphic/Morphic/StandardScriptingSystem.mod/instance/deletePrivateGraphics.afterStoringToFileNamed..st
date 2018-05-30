form dictionary
deletePrivateGraphics: nameList afterStoringToFileNamed: aFileName
	"This method is used to strip private graphics from the FormDictionary and store them on a file of the given name"

	| replacement toRemove aReferenceStream |
	toRemove := Dictionary new.
	replacement := FormDictionary at: #Gets.

	nameList do:
		[:aKey |
			| keySymbol |
			keySymbol := aKey asSymbol.
			(toRemove at: keySymbol put: (self formAtKey: keySymbol)).
			FormDictionary at: keySymbol put: replacement].

	aReferenceStream := ReferenceStream fileNamed: aFileName.
	aReferenceStream nextPut: toRemove.
	aReferenceStream close