drawing
drawOn: aCanvas 
	| _gsSqueakTemp_clip _gsSqueakTemp_rects |
	super drawOn: aCanvas.
	showPageBreaks == false
		ifTrue: [^ self].
	_gsSqueakTemp_clip := aCanvas clipRect.
	_gsSqueakTemp_rects := self printer pageRectangles.
	_gsSqueakTemp_rects
		do: [:each | 
			each bottom > _gsSqueakTemp_clip bottom
				ifTrue: [^ self].
			aCanvas
				fillRectangle: (self left @ each bottom corner: self right @ each bottom + 1)
				color: Color red]