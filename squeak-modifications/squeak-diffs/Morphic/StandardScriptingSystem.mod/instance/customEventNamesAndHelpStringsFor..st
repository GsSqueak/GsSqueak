*Morphic-Etoys-customevents-custom events
customEventNamesAndHelpStringsFor: aPlayer
	| retval help helpStrings morph |
	morph := aPlayer costume renderedMorph.
	retval := OrderedCollection new.
	self customEventsRegistry
		keysAndValuesDo: [ :k :v |
			helpStrings := Array streamContents: [ :hsStream |
				v keysAndValuesDo: [ :registrant :array |
					(morph isKindOf: array second) ifTrue: [
						help := String streamContents: [ :stream |
										v size > 1
											ifTrue: [ stream nextPut: $(;
													nextPutAll: array second name translated;
													nextPut: $);
													space ].
										stream nextPutAll: array first translated].
						hsStream nextPut: help]]].
			helpStrings isEmpty ifFalse: [retval add: { k. helpStrings } ]].
	^ retval sort: [ :a :b | a first < b first ]