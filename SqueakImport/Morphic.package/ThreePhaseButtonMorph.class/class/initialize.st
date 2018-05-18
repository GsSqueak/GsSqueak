class initialization
initialize
	"ThreePhaseButtonMorph initialize"
	| extent inset |
	extent := 12@12.
	inset := 3.

	#('CheckBoxOff' 'CheckBoxOn' 'CheckBoxPressed') do: [:button |
		| f r |
		f := ColorForm extent: extent depth: 1.
		f colors: {Color transparent. Color black}.
		f borderWidth: 1.
		r := f boundingBox insetBy: inset.
		button = 'CheckBoxPressed' ifTrue: [f border: r width: 1].
		button = 'CheckBoxOn' ifTrue: [f fillBlack: r].
		ScriptingSystem saveForm: f atKey: button].

	#('RadioButtonOff' 'RadioButtonOn' 'RadioButtonPressed') do: [:button |
		| f r c |
		f := ColorForm extent: extent depth: 1.
		f colors: {Color transparent. Color black}.
		r := f boundingBox.
		c := f getCanvas.
		c frameOval: r color: Color black.
		r := r insetBy: inset.
		button = 'RadioButtonPressed' ifTrue:
			[c frameOval: r color: Color black].
		button = 'RadioButtonOn' ifTrue:
			[c fillOval: r color: Color black].
		ScriptingSystem saveForm: f atKey: button]