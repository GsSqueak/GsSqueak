other
addRecordLevelSliderIn: aPoint

	| levelSlider r |
	levelSlider := SimpleSliderMorph new
		color: color darker;
		extent: (aPoint x * 0.75) asInteger@(aPoint y*0.6) asInteger;
		target: recorder;
		actionSelector: #recordLevel:;
		adjustToValue: recorder recordLevel.
	r := AlignmentMorph newRow
		color: color;
		layoutInset: 0;
		wrapCentering: #center; cellPositioning: #leftCenter;
		hResizing: #shrinkWrap;
		vResizing: #rigid;
		height: aPoint y + 2.
	r addMorphBack: (StringMorph contents: '0 ' font: Preferences standardButtonFont).
	r addMorphBack: levelSlider.
	r addMorphBack: (StringMorph contents: ' 10' font: Preferences standardButtonFont).
	self addMorphBack: r.
