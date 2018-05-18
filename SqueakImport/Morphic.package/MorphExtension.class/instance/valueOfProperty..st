accessing - other properties
valueOfProperty: aSymbol 
"answer the value of the receiver's property named aSymbol"

	^otherProperties ifNotNil: [ otherProperties at: aSymbol ifAbsent: nil ]