copying
withoutDuplicates
	"Answer a copy of the receiver that preserves order but eliminates any duplicates."
	| seen |
	seen := Set new: self size.
	^self select: [:each| seen ifAbsentAdd: each]
