class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#SimpleSliderMorph. #authoringPrototype. 'Slider' translatedNoop. 'A slider for showing and setting numeric values.' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.
						cl registerQuad: {#SimpleSliderMorph. #authoringPrototype. 'Slider' translatedNoop. 'A slider for showing and setting numeric values.' translatedNoop}
						forFlapNamed: 'Supplies'.
						cl registerQuad: {#SimpleSliderMorph. #authoringPrototype. 'Slider' translatedNoop. 'A slider for showing and setting numeric values.' translatedNoop}
						forFlapNamed: 'Scripting']