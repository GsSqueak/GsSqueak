scripting
authoringPrototype
	| aSlider nominalColor |
	"self currentHand attachMorph: SimpleSliderMorph authoringPrototype"

	aSlider := super authoringPrototype beSticky.
	aSlider extent: 14@120.
	nominalColor := Color r: 0.4 g: 0.86 b: 0.7.
	aSlider color: nominalColor.
	aSlider sliderColor: nominalColor muchLighter.
	aSlider descending: true.
	aSlider setScaledValue: 0.3.
	^ aSlider