layout
rateControl

	| rateSlider middleLine r |
	rateSlider := SimpleSliderMorph new
		color: color;
		sliderColor: Color gray;
		extent: 180@6;
		target: self;
		actionSelector: #setLogRate:;
		minVal: -1.0;
		maxVal: 1.0;
		adjustToValue: 0.0.
	middleLine := Morph new  "center indicator for pan slider"
		color: (Color r: 0.4 g: 0.4 b: 0.4);
		extent: 1@(rateSlider height - 4);
		position: rateSlider center x@(rateSlider top + 2).
	rateSlider addMorphBack: middleLine.
	r := self makeRow
		hResizing: #shrinkWrap;
		vResizing: #rigid;
		height: 24.
	r addMorphBack: (StringMorph contents: 'slow ' translated).
	r addMorphBack: rateSlider.
	r addMorphBack: (StringMorph contents: ' fast' translated).
	^ r
