form dictionary
formAtKey: aString
	"Answer the form saved under the given key"

	Symbol hasInterned: aString ifTrue:
		[:aKey | ^ FormDictionary at: aKey ifAbsent: [FormDictionary at: #Cat]].
	^ FormDictionary at: #Cat