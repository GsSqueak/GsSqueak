-Etoys-customevents-custom events
customEventNamesAndHelpStringsFor: aPlayer 
	| _gsSqueakTemp_retval _gsSqueakTemp_morph |
	_gsSqueakTemp_morph := aPlayer costume renderedMorph.
	_gsSqueakTemp_retval := SortedCollection
				sortBlock: [:a :b | a first < b first].
	self customEventsRegistry
		keysAndValuesDo: [:k :v | 
			| helpStrings |
			helpStrings := Array
						streamContents: [:hsStream | v
								keysAndValuesDo: [:registrant :array | (_gsSqueakTemp_morph isKindOf: array second)
										ifTrue: [| help |
											help := String
														streamContents: [:stream | 
															v size > 1
																ifTrue: [stream nextPut: $(;
																		 nextPutAll: array second name;
																		 nextPut: $);
																		 space].
															stream nextPutAll: array first].
											hsStream nextPut: help]]].
			helpStrings isEmpty
				ifFalse: [_gsSqueakTemp_retval add: {k. helpStrings}]].
	^ _gsSqueakTemp_retval