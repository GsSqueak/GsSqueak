actions
cursorFor: anAction oldCursor: oldCursor currentNib: aNibForm color: aColor 
	"Return the cursor to use with this painting action/tool. Offset of the 
	form must be set."

	| ff width co larger c box |

	anAction == #paint:
		ifTrue: ["Make a cursor from the brush and the color"
			width := aNibForm width.
			c := self ringColorFor: aColor.
			co := oldCursor offset - (width // 4 @ 34 - (width // 6)) min: 0 @ 0.
			larger := width negated + 10 @ 0 extent: oldCursor extent + (width @ width).
			ff := oldCursor copy: larger.
			ff colors at: 1 put: Color transparent.
			ff colors at: 2 put: Color transparent.
			ff offset: co - (width @ width // 2).
			ff getCanvas
				fillOval: (Rectangle center: ff offset negated extent: width @ width)
				color: Color transparent
				borderWidth: 1
				borderColor: c.
			^ ff].
	anAction == #erase:
		ifTrue: ["Make a cursor from the cursor and the color"
			width := aNibForm width.
			co := oldCursor offset + (width // 2 @ 4) min: 0 @ 0.
			larger := 0 @ 0 extent: oldCursor extent + (width @ width).
			ff := oldCursor copy: larger.
			ff offset: co - (width @ width // 2).
			ff
				fill: (box := co negated extent: width @ width)
				fillColor: (Color r: 0.5 g: 0.5 b: 1.0).
			ff
				fill: (box insetBy: 1 @ 1)
				fillColor: Color transparent.
			^ ff].
	^ oldCursor