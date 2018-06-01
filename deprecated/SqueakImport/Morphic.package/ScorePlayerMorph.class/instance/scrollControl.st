layout
scrollControl

	| r |
	scrollSlider := SimpleSliderMorph new
		color: color;
		sliderColor: Color gray;
		extent: 360@6;
		target: scorePlayer;
		actionSelector: #positionInScore:;
		adjustToValue: scorePlayer positionInScore.
	r := self makeRow
		hResizing: #shrinkWrap;
		vResizing: #rigid;
		height: 24.
	r addMorphBack: (StringMorph contents: 'start ' translated).
	r addMorphBack: scrollSlider.
	r addMorphBack: (StringMorph contents: ' end' translated).
	^ r
