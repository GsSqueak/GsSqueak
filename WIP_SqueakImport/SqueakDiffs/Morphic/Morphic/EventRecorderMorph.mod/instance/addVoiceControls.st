sound
addVoiceControls 

	| levelSlider r meterBox |
	voiceRecorder := SoundRecorder new
		desiredSampleRate: 11025.0;		"<==try real hard to get the low rate"
		codec: (GSMCodec new).		"<--this should compress better than ADPCM.. is it too slow?"
		"codec: (ADPCMCodec new initializeForBitsPerSample: 4 samplesPerFrame: 0)."

	levelSlider := SimpleSliderMorph new
		color: color;
		extent: 100@2;
		target: voiceRecorder;
		actionSelector: #recordLevel:;
		adjustToValue: voiceRecorder recordLevel.
	r := AlignmentMorph newRow
		color: color;
		layoutInset: 0;
		wrapCentering: #center; cellPositioning: #leftCenter;
		hResizing: #shrinkWrap;
		vResizing: #rigid;
		height: 24.
	r addMorphBack: (StringMorph contents: '0 ').
	r addMorphBack: levelSlider.
	r addMorphBack: (StringMorph contents: ' 10').
	self addMorphBack: r.

	meterBox := Morph new extent: 102@18; color: Color gray.
	recordMeter := Morph new extent: 1@16; color: Color yellow.
	recordMeter position: meterBox topLeft + (1@1).
	meterBox addMorph: recordMeter.

	r := AlignmentMorph newRow vResizing: #shrinkWrap.
	r addMorphBack: meterBox.
	self addMorphBack: r.
