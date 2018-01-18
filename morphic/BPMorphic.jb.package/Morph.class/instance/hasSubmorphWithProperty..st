submorphs-accessing
hasSubmorphWithProperty: aSymbol 	^ submorphs		anySatisfy: [:m | m hasProperty: aSymbol]