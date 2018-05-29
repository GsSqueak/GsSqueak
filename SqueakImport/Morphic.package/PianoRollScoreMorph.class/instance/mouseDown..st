event handling
mouseDown: evt

	| noteMorphs chordRect |
	(self notesInRect: ((evt cursorPoint extent: 1@0) expandBy: 2@30)) isEmpty
		ifTrue: ["If not near a note, then put up score edit menu"
				^ self invokeScoreMenu: evt].

	"Clicked near (but not on) a note, so play all notes at the cursor time"
	noteMorphs := self notesInRect: ((evt cursorPoint extent: 1@0) expandBy: 0@self height).
	chordRect := (self innerBounds withLeft: evt cursorPoint x) withWidth: 1.
	soundsPlayingMorph := Morph newBounds: chordRect color: Color green.
	self addMorphBack: soundsPlayingMorph.
	
	soundsPlaying := IdentityDictionary new.
	noteMorphs do:
		[:m | | sound | sound := m soundOfDuration: 999.0.
		soundsPlaying at: m put: sound.
		SoundPlayer resumePlaying: sound quickStart: false].

