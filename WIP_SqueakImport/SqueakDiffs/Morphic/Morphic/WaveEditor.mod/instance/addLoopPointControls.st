initialization
addLoopPointControls

	|  m  aWrapper |
	aWrapper := AlignmentMorph newRow.
	aWrapper color: self color; borderWidth: 0; layoutInset: 0.
	aWrapper hResizing: #spaceFill; vResizing: #rigid; extent: 5@20; wrapCentering: #center; cellPositioning: #leftCenter.

	m := StringMorph new contents: 'Loop end: ' translated; font: Preferences standardEToysButtonFont.
	aWrapper addMorphBack: m.
	m := UpdatingStringMorph new
		target: self; getSelector: #loopEnd; putSelector: #loopEnd:;
		font: Preferences standardEToysButtonFont;
		growable: false; width: 100; step.
	aWrapper addMorphBack: m.
	aWrapper addTransparentSpacerOfSize: 4 @ 1.
	m := StringMorph new contents: 'Loop length: ' translated ; font: Preferences standardEToysButtonFont.
	aWrapper addMorphBack: m.
	m := UpdatingStringMorph new
		target: self; getSelector: #loopLength; putSelector: #loopLength:;
		floatPrecision: 0.001;
		font: Preferences standardEToysButtonFont;
		growable: false; width: 100; step.
	aWrapper addMorphBack: m.
aWrapper addTransparentSpacerOfSize: 4 @ 1.
	m := StringMorph new contents: 'Loop cycles: ' translated; font: Preferences standardEToysButtonFont.
	aWrapper addMorphBack: m.
	m := UpdatingStringMorph new
		target: self; getSelector: #loopCycles; putSelector: #loopCycles:;
		floatPrecision: 0.001;
		font: Preferences standardEToysButtonFont;
		growable: false; width: 100; step.
	aWrapper addMorphBack: m.
aWrapper addTransparentSpacerOfSize: 4 @ 1.
	m := StringMorph new contents: 'Frequency: ' translated; font: Preferences standardEToysButtonFont.
	aWrapper addMorphBack: m.
	m := UpdatingStringMorph new
		target: self; getSelector: #perceivedFrequency; putSelector: #perceivedFrequency:;
		floatPrecision: 0.001;
		font: Preferences standardEToysButtonFont;
		growable: false; width: 100; step.
	aWrapper addMorphBack: m.

	self addMorphBack: aWrapper
