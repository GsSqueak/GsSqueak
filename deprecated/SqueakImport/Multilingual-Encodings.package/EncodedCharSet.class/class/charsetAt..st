class methods
charsetAt: encoding
"Find  the char set encoding that matches 'encoding'; return a decent default rather than nil"
	^ (EncodedCharSets at: encoding + 1 ifAbsent: [nil]) ifNil: [Unicode].