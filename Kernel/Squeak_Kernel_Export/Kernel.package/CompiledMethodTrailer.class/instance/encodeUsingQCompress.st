encoding
encodeUsingQCompress

	"data is string, encode it using qCompress method"
	| str length encodedLength |

	self assert: data isString.
	str := self qCompress: data.
	length := str position.
	encodedLength := self encodeLengthField: length.

	str nextPutAll: encodedLength.
	"trailing byte"
	str nextPut: (self kindAsByte + encodedLength size - 1).
	
	encodedData := str contents
	