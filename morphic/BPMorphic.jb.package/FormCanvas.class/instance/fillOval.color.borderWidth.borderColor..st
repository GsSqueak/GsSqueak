drawing-ovals
fillOval: r color: fillColor borderWidth: borderWidth borderColor: borderColor 
	"draw the border of the oval"
	| _gsSqueakTemp_rect |
	_gsSqueakTemp_rect := (r translateBy: origin) truncated.
	(borderWidth = 0
			or: [borderColor isTransparent])
		ifFalse: [self setFillColor: borderColor.
			(r area > 10000
					or: [fillColor isTranslucent])
				ifTrue: [port frameOval: _gsSqueakTemp_rect borderWidth: borderWidth]
				ifFalse: [port fillOval: _gsSqueakTemp_rect]].
	"faster this way"
	"fill the inside"
	fillColor isTransparent
		ifFalse: [self setFillColor: fillColor.
			port
				fillOval: (_gsSqueakTemp_rect insetBy: borderWidth)]