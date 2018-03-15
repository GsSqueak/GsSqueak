graphical support
showFormsAcrossTopOfScreen: aFormList 
	"Display the given array of forms across the top of the screen,
	wrapping to subsequent lines if needed. Useful for example for looking
	at sets of rotations and animations. 6/10/96 sw"
	| _gsSqueakTemp_position _gsSqueakTemp_maxHeight _gsSqueakTemp_screenBox _gsSqueakTemp_ceiling |
	_gsSqueakTemp_position := 20.
	_gsSqueakTemp_maxHeight := 0.
	_gsSqueakTemp_ceiling := 0.
	_gsSqueakTemp_screenBox := Display boundingBox.
	aFormList
		do: [:elem | 
			elem displayAt: _gsSqueakTemp_position @ _gsSqueakTemp_ceiling.
			_gsSqueakTemp_maxHeight := _gsSqueakTemp_maxHeight max: elem boundingBox height.
			_gsSqueakTemp_position := _gsSqueakTemp_position + elem boundingBox width + 5.
			_gsSqueakTemp_position > (_gsSqueakTemp_screenBox right - 100)
				ifTrue: [_gsSqueakTemp_position := 20.
					_gsSqueakTemp_ceiling := _gsSqueakTemp_ceiling + _gsSqueakTemp_maxHeight + 10.
					_gsSqueakTemp_maxHeight := 0]]