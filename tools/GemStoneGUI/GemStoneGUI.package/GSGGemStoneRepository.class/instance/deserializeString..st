deserialization - new
deserializeString: aStream

	| string |
	string := String readFrom: aStream.
	aStream back.
	^ string