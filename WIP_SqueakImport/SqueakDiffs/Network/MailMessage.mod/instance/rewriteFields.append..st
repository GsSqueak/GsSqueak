fields
rewriteFields: aBlock append: appendBlock
	"Rewrite header fields. The body is not modified.
	Each field's key and value is reported to aBlock. The block's return value is the replacement for the entire header line. Nil means don't change the line, empty means delete it. After all fields are processed, evaluate appendBlock and append the result to the header."

	| old new appendString |
	self halt: 'this method is out of date.  it needs to update body, at the very least.  do we really need this now that we have setField:to: and setField:toString: ?!'.
	old := ReadStream on: text.
	new := WriteStream on: (String new: text size).
	self fieldsFrom: old do: [ :fName :fValue | | result |
		result := aBlock value: fName value: fValue.
		result ifNil: [new nextPutAll: fName, ': ', fValue; cr]
			ifNotNil: [result isEmpty
				ifFalse: [new nextPutAll: result.
					result last = Character cr ifFalse: [new cr]]]].
	appendString := appendBlock value.
	appendString isEmptyOrNil ifFalse:
		[new nextPutAll: appendString.
		appendString last = Character cr ifFalse: [new cr]].
	new cr. "End of header"
	text := new contents, old upToEnd.
