actions
cursorFor: anAction oldCursor: oldCursor currentNib: aNibForm color: aColor 
	"Return the cursor to use with this painting action/tool. Offset of the 
	form must be set."
	| _gsSqueakTemp_ff _gsSqueakTemp_width _gsSqueakTemp_co _gsSqueakTemp_larger _gsSqueakTemp_c _gsSqueakTemp_box |
	anAction == #paint:
		ifTrue: ["Make a cursor from the brush and the color"
			_gsSqueakTemp_width := aNibForm width.
			_gsSqueakTemp_c := self ringColorFor: aColor.
			_gsSqueakTemp_co := oldCursor offset - (_gsSqueakTemp_width // 4 @ 34 - (_gsSqueakTemp_width // 6)) min: 0 @ 0.
			_gsSqueakTemp_larger := _gsSqueakTemp_width negated + 10 @ 0 extent: oldCursor extent + (_gsSqueakTemp_width @ _gsSqueakTemp_width).
			_gsSqueakTemp_ff := oldCursor copy: _gsSqueakTemp_larger.
			_gsSqueakTemp_ff colors at: 1 put: Color transparent.
			_gsSqueakTemp_ff colors at: 2 put: Color transparent.
			_gsSqueakTemp_ff offset: _gsSqueakTemp_co - (_gsSqueakTemp_width @ _gsSqueakTemp_width // 2).
			_gsSqueakTemp_ff getCanvas
				fillOval: (Rectangle center: _gsSqueakTemp_ff offset negated extent: _gsSqueakTemp_width @ _gsSqueakTemp_width)
				color: Color transparent
				borderWidth: 1
				borderColor: _gsSqueakTemp_c.
			^ _gsSqueakTemp_ff].
	anAction == #erase:
		ifTrue: ["Make a cursor from the cursor and the color"
			_gsSqueakTemp_width := aNibForm width.
			_gsSqueakTemp_co := oldCursor offset + (_gsSqueakTemp_width // 2 @ 4) min: 0 @ 0.
			_gsSqueakTemp_larger := 0 @ 0 extent: oldCursor extent + (_gsSqueakTemp_width @ _gsSqueakTemp_width).
			_gsSqueakTemp_ff := oldCursor copy: _gsSqueakTemp_larger.
			_gsSqueakTemp_ff offset: _gsSqueakTemp_co - (_gsSqueakTemp_width @ _gsSqueakTemp_width // 2).
			_gsSqueakTemp_ff
				fill: (_gsSqueakTemp_box := _gsSqueakTemp_co negated extent: _gsSqueakTemp_width @ _gsSqueakTemp_width)
				fillColor: (Color
						r: 0.5
						g: 0.5
						b: 1.0).
			_gsSqueakTemp_ff
				fill: (_gsSqueakTemp_box insetBy: 1 @ 1)
				fillColor: Color transparent.
			^ _gsSqueakTemp_ff].
	^ oldCursor