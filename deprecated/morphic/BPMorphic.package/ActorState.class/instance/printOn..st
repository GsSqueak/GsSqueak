printing
printOn: aStream 
	aStream nextPutAll: 'ActorState for ' , owningPlayer externalName , ' '.
	penDown
		ifNotNil: [aStream cr; nextPutAll: 'penDown ' , penDown printString].
	penColor
		ifNotNil: [aStream cr; nextPutAll: 'penColor ' , penColor printString].
	penSize
		ifNotNil: [aStream cr; nextPutAll: 'penSize ' , penSize printString].
	instantiatedUserScriptsDictionary
		ifNotNil: [aStream cr; nextPutAll: '+ ' , instantiatedUserScriptsDictionary size printString , ' user scripts']