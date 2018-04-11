class initialization
initialize
	"ThreePhaseButtonMorph initialize"
	| _gsSqueakTemp_extent _gsSqueakTemp_inset |
	_gsSqueakTemp_extent := 12 @ 12.
	_gsSqueakTemp_inset := 3.
	#('CheckBoxOff' 'CheckBoxOn' 'CheckBoxPressed' )
		do: [:button | 
			| f r |
			f := ColorForm extent: _gsSqueakTemp_extent depth: 1.
			f colors: {Color transparent. Color black}.
			f borderWidth: 1.
			r := f boundingBox insetBy: _gsSqueakTemp_inset.
			button = 'CheckBoxPressed'
				ifTrue: [f border: r width: 1].
			button = 'CheckBoxOn'
				ifTrue: [f fillBlack: r].
			ScriptingSystem saveForm: f atKey: button].
	#('RadioButtonOff' 'RadioButtonOn' 'RadioButtonPressed' )
		do: [:button | 
			| f r c |
			f := ColorForm extent: _gsSqueakTemp_extent depth: 1.
			f colors: {Color transparent. Color black}.
			r := f boundingBox.
			c := f getCanvas.
			c frameOval: r color: Color black.
			r := r insetBy: _gsSqueakTemp_inset.
			button = 'RadioButtonPressed'
				ifTrue: [c frameOval: r color: Color black].
			button = 'RadioButtonOn'
				ifTrue: [c fillOval: r color: Color black].
			ScriptingSystem saveForm: f atKey: button]