method changes
messageListForChangesWhich: aBlock ifNone: ifEmptyBlock

	| answer |

	answer := self changedMessageListAugmented select: [ :each |
		aBlock value: each actualClass value: each methodSymbol
	].
	answer isEmpty ifTrue: [^ifEmptyBlock value].
	^answer
