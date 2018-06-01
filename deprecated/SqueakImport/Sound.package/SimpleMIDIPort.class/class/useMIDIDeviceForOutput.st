preferences
useMIDIDeviceForOutput

	<preference: 'Use MIDI device for output'
		category: #media
		description: 'If true, will try to open a native MIDI device when playing MIDI scores.'
		type: #Boolean>
	^ UseMIDIDeviceForOutput ifNil: [false]