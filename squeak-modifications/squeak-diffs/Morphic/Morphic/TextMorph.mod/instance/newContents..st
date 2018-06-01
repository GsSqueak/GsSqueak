accessing
newContents: stringOrText 
	"Accept new text contents."
	| newText embeddedMorphs oldSelection |
	newText := stringOrText isString 
		ifTrue: [Text fromString: stringOrText copy ]
		ifFalse: [ stringOrText copy asText.	"should be veryDeepCopy?" ].

	(text = newText and: [text runs = newText runs]) ifTrue: [^ self].	"No substantive change"
	text ifNotNil: [(embeddedMorphs := text embeddedMorphs)
			ifNotNil: 
				[self removeAllMorphsIn: embeddedMorphs.
				embeddedMorphs do: [:m | m delete]]].

	oldSelection := editor ifNotNil: [:ed | ed selectionInterval].
	text := newText.

	"add all morphs off the visible region; they'll be moved into the right 
	place when they become visible. (this can make the scrollable area too 
	large, though)"
	newText embeddedMorphs do: 
		[:m | 
		self addMorph: m.
		m position: -1000 @ 0].
	self releaseParagraph.
	"update the paragraph cache"
	self paragraph.
	oldSelection ifNotNil: [:sel | self selectFrom: sel first to: sel last].
	"re-instantiate to set bounds"
	self world ifNotNil: [self world startSteppingSubmorphsOf: self]