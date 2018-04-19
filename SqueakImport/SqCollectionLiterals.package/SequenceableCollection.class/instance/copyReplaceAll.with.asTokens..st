*SqCollectionLiterals-*SqCollectionLiterals-private
copyReplaceAll: oldSubstring with: newSubstring asTokens: ifTokens
	"Answer a copy of the receiver in which all occurrences of
	oldSubstring have been replaced by newSubstring.
	ifTokens (valid for Strings only) specifies that the characters
	surrounding the recplacement must not be alphanumeric.
		Bruce Simth,  must be incremented by 1 and not 
	newSubstring if ifTokens is true.  See example below. "

	| currentIndex |
	(ifTokens and: [ self isString not and: [ self isText not ] ]) ifTrue: [
		self error: 'Token replacement only valid for Strings' ].
	(currentIndex := self indexOfSubCollection: oldSubstring startingAt: 1) = 0 ifTrue: [ ^self copy ].
	oldSubstring size = newSubstring size ifTrue: [ "Special case"
		| string startSearch endIndex |
		string := self copy.
		startSearch := 1.
		[
			endIndex := currentIndex + oldSubstring size - 1.
			(ifTokens and: [
				(currentIndex > 1 and: [ (self at: currentIndex - 1) isAlphaNumeric ])
					or: [ endIndex < self size and: [ (self at: endIndex + 1) isAlphaNumeric ] ] ])
				ifFalse: [ "match"
					string
						replaceFrom: currentIndex
						to: endIndex
						with: newSubstring
						startingAt: 1 ].
			startSearch := endIndex + 1.
			(currentIndex := self indexOfSubCollection: oldSubstring startingAt: startSearch) = 0 ] whileFalse.
		^string ].
	^self species new: self size streamContents: [ :stream |
		| startSearch endIndex |
		startSearch := 1.
		[
			endIndex := currentIndex + oldSubstring size - 1.
			(ifTokens and: [
				(currentIndex > 1 and: [ (self at: currentIndex - 1) isAlphaNumeric ])
					or: [ endIndex < self size and: [ (self at: endIndex + 1) isAlphaNumeric ] ] ])
				ifFalse: [ "match"
					stream
						next: currentIndex - startSearch
							putAll: self
							startingAt: startSearch;
						nextPutAll: newSubstring ]
				ifTrue: [
					stream
						next: currentIndex - startSearch + oldSubstring size
						putAll: self
						startingAt: startSearch ].
			startSearch := endIndex + 1.
			(currentIndex := self indexOfSubCollection: oldSubstring startingAt: startSearch) = 0 ] whileFalse.
		stream
			next: self size - startSearch + 1
			putAll: self
			startingAt: startSearch ]

"Test case:
	'test te string' copyReplaceAll: 'te' with: 'longone' asTokens: true   "
