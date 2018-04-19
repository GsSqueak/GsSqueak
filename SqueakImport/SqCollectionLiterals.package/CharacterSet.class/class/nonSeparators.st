*SqCollectionLiterals-*SqCollectionLiterals-accessing
nonSeparators
	"return a set containing everything but the whitespace characters"

	^NonSeparators ifNil: [
		NonSeparators := self separators complement ]
