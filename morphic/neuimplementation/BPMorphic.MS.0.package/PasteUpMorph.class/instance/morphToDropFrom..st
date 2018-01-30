dropping/grabbing
morphToDropFrom: aMorph 
	"Given a morph being carried by the hand, which the hand is about to
	drop, answer the actual morph to be deposited. Normally this would
	be just the morph itself, but several unusual cases arise, which this
	method is designed to service."
	| aNail representee handy posBlock |
	handy := self primaryHand.
	posBlock := [:z | 
			| tempPos |
			tempPos := handy position - (handy targetOffset - aMorph formerPosition * (z extent / aMorph extent)) rounded.
			self pointFromWorld: tempPos].
	self alwaysShowThumbnail
		ifTrue: [aNail := aMorph
						representativeNoTallerThan: self maxHeightToAvoidThumbnailing
						norWiderThan: self maximumThumbnailWidth
						thumbnailHeight: self heightForThumbnails.
			aNail == aMorph
				ifFalse: [aMorph formerPosition: aMorph position.
					aNail
						position: (posBlock value: aNail)].
			^ aNail].
	((aMorph isKindOf: MorphThumbnail)
			and: [(representee := aMorph morphRepresented) owner isNil])
		ifTrue: [representee
				position: (posBlock value: representee).
			^ representee].
	self showingListView
		ifTrue: [^ aMorph
				listViewLineForFieldList: (self valueOfProperty: #fieldListSelectors)].
	(aMorph hasProperty: #newPermanentScript)
		ifTrue: [^ aMorph asEmptyPermanentScriptor].
	(aMorph isPhraseTileMorph
			or: [aMorph isSyntaxMorph])
		ifFalse: [^ aMorph morphToDropInPasteUp: self].
	aMorph userScriptSelector isEmptyOrNil
		ifTrue: ["non-user"
			self automaticPhraseExpansion
				ifFalse: [^ aMorph]].
	^ aMorph morphToDropInPasteUp: self