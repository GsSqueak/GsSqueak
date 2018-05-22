layout
panAndVolControlsFor: trackIndex

	| volSlider panSlider c r middleLine pianoRollColor |
	pianoRollColor := (Color wheel: scorePlayer score tracks size) at: trackIndex.
	volSlider := SimpleSliderMorph new
		color: color;
		sliderColor: pianoRollColor;
		extent: 101@6;
		target: scorePlayer;
		arguments: (Array with: trackIndex);
		actionSelector: #volumeForTrack:put:;
		minVal: 0.0;
		maxVal: 1.0;
		adjustToValue: (scorePlayer volumeForTrack: trackIndex).
	panSlider := SimpleSliderMorph new
		color: color;
		sliderColor: pianoRollColor;
		extent: 101@6;
		target: scorePlayer;
		arguments: (Array with: trackIndex);
		actionSelector: #panForTrack:put:;
		minVal: 0.0;
		maxVal: 1.0;		
		adjustToValue: (scorePlayer panForTrack: trackIndex).
	c := AlignmentMorph newColumn
		color: color;
		layoutInset: 0;
		wrapCentering: #center; cellPositioning: #topCenter;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap.
	middleLine := Morph new  "center indicator for pan slider"
		color: (Color r: 0.4 g: 0.4 b: 0.4);
		extent: 1@(panSlider height - 4);
		position: panSlider center x@(panSlider top + 2).
	panSlider addMorphBack: middleLine.
	r := self makeRow.
	r addMorphBack: (StringMorph contents: '0').
	r addMorphBack: volSlider.
	r addMorphBack: (StringMorph contents: '10').
	c addMorphBack: r.
	r := self makeRow.
	r addMorphBack: (StringMorph contents: 'L' translated).
	r addMorphBack: panSlider.
	r addMorphBack: (StringMorph contents: 'R' translated).
	c addMorphBack: r.
	^ c
