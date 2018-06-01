display
displaySelectionInLine: line on: aCanvas 
	| leftX rightX w |
	selectionStart ifNil: [^self].	"No selection"
	aCanvas isShadowDrawing ifTrue: [ ^self ].	"don't draw selection with shadow"
	selectionStart = selectionStop 
		ifTrue: 
			["Only show caret on line where clicked"

			selectionStart textLine ~= line ifTrue: [^self]]
		ifFalse:
			["Test entire selection before or after here"

			(selectionStop stringIndex < line first 
				or: [selectionStart stringIndex > (line last + 1)]) ifTrue: [^self].	"No selection on this line"
			(selectionStop stringIndex = line first 
				and: [selectionStop textLine ~= line]) ifTrue: [^self].	"Selection ends on line above"
			(selectionStart stringIndex = (line last + 1) 
				and: [selectionStop textLine ~= line]) ifTrue: [^self]].	"Selection begins on line below"
	leftX := (selectionStart stringIndex <= line first 
				ifTrue: [line ]
				ifFalse: [selectionStart ])left.
	rightX := (selectionStop stringIndex > (line last + 1) or: 
					[selectionStop stringIndex = (line last + 1) 
						and: [selectionStop textLine ~= line]]) 
				ifTrue: [line right]
				ifFalse: [selectionStop left].
	selectionStart = selectionStop 
		ifTrue: [
			rightX := rightX + 1.
			caretRect := (leftX-2) @ line top corner: (rightX+2)@ line bottom. "sigh..."
			self showCaret ifFalse: [^self].
			w := (Editor dumbbellCursor
				ifTrue: [self displayDumbbellCursorOn: aCanvas at: leftX in: line]
				ifFalse: [self displaySimpleCursorOn: aCanvas at: leftX in: line]).
			caretRect := (leftX-w) @ line top corner: (rightX+w)@ line bottom]
		ifFalse: [
			caretRect := nil.
			aCanvas fillRectangle: (leftX @ line top corner: rightX @ line bottom)
				color: (self focused ifTrue: [self selectionColor] ifFalse: [self unfocusedSelectionColor])]