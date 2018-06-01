accessing
newContents: stringOrText 
	"Accept new text contents."
	| _gsSqueakTemp_newText _gsSqueakTemp_oldSelection |
	_gsSqueakTemp_newText := stringOrText isString
				ifTrue: [Text fromString: stringOrText copy]
				ifFalse: [stringOrText copy asText].
	(text = _gsSqueakTemp_newText
			and: [text runs = _gsSqueakTemp_newText runs])
		ifTrue: [^ self].
	"No substantive change"
	text
		ifNotNil: [text embeddedMorphs
				ifNotNil: [:_gsSqueakTemp_embeddedMorphs | 
					self removeAllMorphsIn: _gsSqueakTemp_embeddedMorphs.
					_gsSqueakTemp_embeddedMorphs
						do: [:m | m delete]]].
	_gsSqueakTemp_oldSelection := editor
				ifNotNil: [:ed | ed selectionInterval].
	text := _gsSqueakTemp_newText.
	"add all morphs off the visible region; they'll be moved into the right 
	place when they become visible. (this can make the scrollable area
	too 
	large, though)"
	_gsSqueakTemp_newText embeddedMorphs
		do: [:m | 
			self addMorph: m.
			m position: -1000 @ 0].
	self releaseParagraph.
	"update the paragraph cache"
	self paragraph.
	_gsSqueakTemp_oldSelection
		ifNotNil: [:sel | self selectFrom: sel first to: sel last].
	"re-instantiate to set bounds"
	self world
		ifNotNil: [self world startSteppingSubmorphsOf: self]