project parameters
projectParameterAt: aKey ifAbsentPut: defaultValueBlock
	"Return the project parameter setting at the given key.  If there is no entry for this key in the Parameters dictionary, create one with the value of defaultValueBlock as its value"

	^ self projectParameters at: aKey ifAbsentPut: defaultValueBlock