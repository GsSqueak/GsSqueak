utilities
outputPortNumFromUser
	"Prompt the user for a MIDI output port. Answer a port number, or nil if the user does not select a port or if MIDI is not supported on this platform."
	"SimpleMIDIPort outputPortNumFromUser"

	| portCount dir portList |
	portCount := self primPortCount.
	portCount = 0 ifTrue: [^ nil].
	portList := OrderedCollection new.
	0 to: portCount - 1 do:[:i |
		dir := self primPortDirectionalityOf: i.
		(dir = 2) | (dir = 3) ifTrue:[portList add: i]].
	^UIManager default
		chooseFrom: (portList collect:[:i| self portDescription: i])
		values: portList
		title: 'MIDI port for output:' translated.

