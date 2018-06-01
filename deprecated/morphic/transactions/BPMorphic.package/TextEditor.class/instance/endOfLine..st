private
endOfLine: position 
	"Redefined in subclasses using Paragraph support"
	| _gsSqueakTemp_targetLine |
	_gsSqueakTemp_targetLine := paragraph lines
				at: (paragraph lineIndexFor: position).
	^ _gsSqueakTemp_targetLine = paragraph lastLine
		ifTrue: [_gsSqueakTemp_targetLine last + 1]
		ifFalse: [_gsSqueakTemp_targetLine last]