Nebraska support
get: aSymbol for: anEventOrHand

	| valuesForHand |

	valuesForHand := self valuesForHand: anEventOrHand.
	^valuesForHand at: aSymbol ifAbsent: [nil].

