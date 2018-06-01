menu
addCustomMenuItems: menu hand: aHandMorph
	super addCustomMenuItems: menu hand: aHandMorph.
	menu addLine.
	envelope updateSelector = #ratio: ifTrue:
		[menu add: 'choose denominator...' translated action: #chooseDenominator:].
	menu add: 'adjust scale...' translated action: #adjustScale:.
	SoundPlayer isReverbOn
		ifTrue: [menu add: 'turn reverb off' translated target: SoundPlayer selector: #stopReverb]
		ifFalse: [menu add: 'turn reverb on' translated target: SoundPlayer selector: #startReverb].
	menu addLine.
	menu add: 'get sound from lib' translated action: #chooseSound:.
	menu add: 'put sound in lib' translated action: #saveSound:.
	menu add: 'read sound from disk...' translated action: #readFromDisk:.
	menu add: 'save sound on disk...' translated action: #saveToDisk:.
	menu add: 'save library on disk...' translated action: #saveLibToDisk:.
