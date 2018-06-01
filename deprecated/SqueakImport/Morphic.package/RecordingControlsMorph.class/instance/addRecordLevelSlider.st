other
addRecordLevelSlider

	| levelSlider r |
	levelSlider := SimpleSliderMorph new
		color: color;
		extent: 100@2;
		target: recorder;
		actionSelector: #recordLevel:;
		adjustToValue: recorder recordLevel.
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
