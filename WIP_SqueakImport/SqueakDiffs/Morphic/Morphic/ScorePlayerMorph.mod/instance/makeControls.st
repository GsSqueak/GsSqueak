layout
makeControls

	| bb r reverbSwitch repeatSwitch |
	r := AlignmentMorph newRow.
	r color: color; borderWidth: 0; layoutInset: 0.
	r hResizing: #shrinkWrap; vResizing: #shrinkWrap; extent: 5@5.
	bb := SimpleButtonMorph new target: self; borderColor: #raised;
			borderWidth: 2; color: color.
	r addMorphBack: (bb label: '<>'; actWhen: #buttonDown;
												actionSelector: #invokeMenu).
	bb := SimpleButtonMorph new target: self; borderColor: #raised;
			borderWidth: 2; color: color.
	r addMorphBack: (bb label: 'Piano Roll' translated;		actionSelector: #makePianoRoll).
	bb := SimpleButtonMorph new target: self; borderColor: #raised;
			borderWidth: 2; color: color.
	r addMorphBack: (bb label: 'Rewind' translated;		actionSelector: #rewind).
	bb := SimpleButtonMorph new target: scorePlayer; borderColor: #raised;
			borderWidth: 2; color: color.
	r addMorphBack: (bb label: 'Play' translated;			actionSelector: #resumePlaying).
	bb := SimpleButtonMorph new target: scorePlayer; borderColor: #raised;
			borderWidth: 2; color: color.
	r addMorphBack: (bb label: 'Pause' translated;			actionSelector: #pause).
	reverbSwitch := SimpleSwitchMorph new
		offColor: color;
		onColor: (Color r: 1.0 g: 0.6 b: 0.6);
		borderWidth: 2;
		label: 'Reverb Disable' translated;
		actionSelector: #disableReverb:;
		target: scorePlayer;
		setSwitchState: SoundPlayer isReverbOn not.
	r addMorphBack: reverbSwitch.
	scorePlayer ifNotNil:
		[repeatSwitch := SimpleSwitchMorph new
			offColor: color;
			onColor: (Color r: 1.0 g: 0.6 b: 0.6);
			borderWidth: 2;
			label: 'Repeat' translated;
			actionSelector: #repeat:;
			target: scorePlayer;
			setSwitchState: scorePlayer repeat.
		r addMorphBack: repeatSwitch].
	^ r
