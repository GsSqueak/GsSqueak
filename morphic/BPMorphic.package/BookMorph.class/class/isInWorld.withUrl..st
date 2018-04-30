url
isInWorld: aWorld withUrl: aUrl 
	"If a book with this url is in the that (current) world, return it. Say if it
	is out or in another world."
	| _gsSqueakTemp_urls _gsSqueakTemp_bks _gsSqueakTemp_short |
	_gsSqueakTemp_urls := OrderedCollection new.
	_gsSqueakTemp_bks := OrderedCollection new.
	aWorld
		allMorphsDo: [:aBook | (aBook isKindOf: BookMorph)
				ifTrue: [_gsSqueakTemp_bks add: aBook.
					(_gsSqueakTemp_urls
							add: (aBook valueOfProperty: #url))
							= aUrl
						ifTrue: [aBook world == aWorld
								ifTrue: [^ aBook]]]].
	"shortcut"
	self
		withAllSubclassesDo: [:cls | cls
				allInstancesDo: [:aBook | (aBook valueOfProperty: #url)
							= aUrl
						ifTrue: [aBook world == aWorld
								ifTrue: [^ aBook]
								ifFalse: [self inform: 'Book may be open in some other project' translated.
									^ aBook]]]].
	"if same book name, use it"
	_gsSqueakTemp_short := (aUrl findTokens: '/') last.
	_gsSqueakTemp_urls
		withIndexDo: [:kk :ind | (kk findTokens: '/') last = _gsSqueakTemp_short
				ifTrue: [^ _gsSqueakTemp_bks at: ind]].
	^ #out