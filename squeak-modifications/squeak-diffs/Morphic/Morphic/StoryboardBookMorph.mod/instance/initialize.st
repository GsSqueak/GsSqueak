initialization
initialize

	newPagePrototype := ZoomAndScrollMorph new extent: Display extent // 3.
	zoomController := ZoomAndScrollControllerMorph new
			setBalloonText: 'Drag in here to zoom, tilt and pan the page above'.

	super initialize.

	self addMorphBack: zoomController.

	alansSliders := {
		{#changeTiltFactor: . #getTiltFactor . 'Pan and tilt sensitivity'}.
		{#changeZoomFactor: . #getZoomFactor . 'Zoom sensitivity'}.
	} collect: [ :sData |
		{
			SimpleSliderMorph new
				extent: 150@10;
				color: Color orange;
				sliderColor: Color gray;
				target: self; 
				actionSelector: sData first;
				setBalloonText: sData third;
				adjustToValue: (self perform: sData second).
			sData second
		}
	].
	alansSliders do: [ :each | self addMorphBack: each first]
