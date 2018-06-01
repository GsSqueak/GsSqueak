editing
appendEvent: noteEvent fullDuration: fullDuration at: selection
	"It is assumed that the noteEvent already has the proper time"

	| track noteLoc |
	track := tracks at: selection first.
	noteLoc := selection third + 1.
	noteEvent midiKey = -1
		ifTrue: [noteLoc := noteLoc - 1]
		ifFalse: ["If not a rest..."
				track := track copyReplaceFrom: noteLoc to: noteLoc - 1
								with: (Array with: noteEvent)].
	track size >= (noteLoc + 1) ifTrue:
		["Adjust times of following events"
		noteLoc + 1 to: track size do:
			[:i | (track at: i) adjustTimeBy: fullDuration]].
	tracks at: selection first put: track