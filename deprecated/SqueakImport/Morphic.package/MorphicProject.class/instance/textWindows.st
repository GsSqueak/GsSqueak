utilities
textWindows
	"Answer a dictionary of all system windows for text display keyed by window title.
	Generate new window titles as required to ensure unique keys in the dictionary."

	| aDict windows title |
	aDict := Dictionary new.
	windows := world submorphs select: [:m | m isSystemWindow].
	windows do:
		[:w | | assoc |
		assoc := w titleAndPaneText.
		assoc ifNotNil:
			[w holdsTranscript ifFalse:
				[title := assoc key.
				(aDict includesKey: title) ifTrue: [ | newKey | "Ensure unique keys in aDict"
					(1 to: 100) detect: [:e |
							newKey := title, '-', e asString.
							(aDict includesKey: newKey) not].
					title := newKey.
					assoc := newKey -> assoc value].
				aDict add: assoc]]].
	^ aDict
