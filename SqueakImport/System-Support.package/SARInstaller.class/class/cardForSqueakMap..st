SqueakMap
cardForSqueakMap: aSqueakMap
	"Answer the current card or a new card."

	(aSqueakMap cardWithId: self squeakMapPackageID)
		ifNotNil: [ :card |
			(card installedVersion = self squeakMapPackageVersion) ifTrue: [ ^card ]
		].

	^self newCardForSqueakMap: aSqueakMap
