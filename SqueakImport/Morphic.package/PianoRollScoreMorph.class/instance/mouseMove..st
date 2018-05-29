event handling
mouseMove: evt

	| noteMorphs chordRect |
	soundsPlaying ifNil: [^ self].
	self autoScrollForX: evt cursorPoint x.

	"Play all notes at the cursor time"
	noteMorphs := self notesInRect: ((evt cursorPoint extent: 1@0) expandBy: 0@self height).
	chordRect := (self innerBounds withLeft: evt cursorPoint x) withWidth: 1.
	soundsPlayingMorph delete.
	soundsPlayingMorph := Morph newBounds: chordRect color: Color green.
	self addMorphBack: soundsPlayingMorph.
	
	noteMorphs do:
		[:m | | sound |  "Add any new sounds"
		(soundsPlaying includesKey: m)
			ifFalse: [sound := m soundOfDuration: 999.0.
					soundsPlaying at: m put: sound.
					SoundPlayer resumePlaying: sound quickStart: false]].
	soundsPlaying keys do:
		[:m |  "Remove any sounds no longer in selection."
		(noteMorphs includes: m)
			ifFalse: [(soundsPlaying at: m) stopGracefully.
					soundsPlaying removeKey: m]].

