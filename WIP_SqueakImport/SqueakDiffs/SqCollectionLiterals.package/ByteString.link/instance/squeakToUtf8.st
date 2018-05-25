*SqCollectionLiterals-*SqCollectionLiterals-converting
squeakToUtf8
	"Convert the given string (self) to UTF-8 from Squeak's internal representation."

	^UTF8TextConverter encodeByteString: self
