private
computeForm
	"Compute and answer a Form to be displayed for this menu."

	| borderInset paraForm menuForm inside |
	borderInset := 4@4.
	paraForm := ((DisplayText text: labelString asText textStyle: MenuStyle)
		foregroundColor: (self userInterfaceTheme textColor ifNil: [Color black])
		backgroundColor: (self userInterfaceTheme color ifNil: [Color white])) form.
	menuForm := Form extent: paraForm extent + (borderInset * 2) depth: paraForm depth.
      menuForm fill: (0 @ 0 extent: menuForm  extent)
                        rule: Form over
                        fillColor: (self userInterfaceTheme color ifNil: [Color white]).
	menuForm
		border: menuForm boundingBox
		width: 2
		fillColor: (self userInterfaceTheme borderColor ifNil: [Color black]).
	
	paraForm displayOn: menuForm at: borderInset.
	lineArray == nil ifFalse:
		[lineArray do:
			[ :line |
			menuForm
				fill: (4 @ ((line * font height) + borderInset y)
						extent: (menuForm width - 8 @ 1))
				rule: Form over
				fillColor: (self userInterfaceTheme lineColor ifNil: [Color black])]].

	frame := Quadrangle new.
	frame region: menuForm boundingBox.
	frame borderWidth: 4.
	inside := frame inside.
	marker := inside topLeft extent: (inside width @ MenuStyle lineGrid).
	selection := 1.

	^ form := menuForm
