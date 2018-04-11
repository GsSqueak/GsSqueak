graphical support
showFormsDictAcrossTopOfScreen: formDict 
	"Display the given Dictionary of forms across the top of the screen,
	wrapping to subsequent lines if needed. Beneath each, put the name
	of the associated key."
	"Utilities showFormsDictAcrossTopOfScreen: HaloIcons"
	| _gsSqueakTemp_screenBox _gsSqueakTemp_position _gsSqueakTemp_maxHeight _gsSqueakTemp_ceiling |
	_gsSqueakTemp_position := 20.
	_gsSqueakTemp_maxHeight := 0.
	_gsSqueakTemp_ceiling := 0.
	_gsSqueakTemp_screenBox := Display boundingBox.
	formDict
		associationsDo: [:assoc | 
			| box elem labelWidth keyString h |
			(elem := assoc value) displayAt: _gsSqueakTemp_position @ _gsSqueakTemp_ceiling.
			box := elem boundingBox.
			h := box height.
			keyString := assoc key isString
						ifTrue: [assoc key]
						ifFalse: [assoc key printString].
			keyString displayAt: _gsSqueakTemp_position @ (_gsSqueakTemp_ceiling + h).
			labelWidth := TextStyle default defaultFont widthOfString: keyString.
			_gsSqueakTemp_maxHeight := _gsSqueakTemp_maxHeight max: h.
			_gsSqueakTemp_position := _gsSqueakTemp_position
						+ (box width max: labelWidth) + 5.
			_gsSqueakTemp_position > (_gsSqueakTemp_screenBox right - 100)
				ifTrue: [_gsSqueakTemp_position := 20.
					_gsSqueakTemp_ceiling := _gsSqueakTemp_ceiling + _gsSqueakTemp_maxHeight + 15.
					_gsSqueakTemp_maxHeight := 0]]