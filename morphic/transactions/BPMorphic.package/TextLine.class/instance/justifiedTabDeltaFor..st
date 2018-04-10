scanning
justifiedTabDeltaFor: spaceIndex 
	"Compute the delta for a tab in a line of justified text, so tab falls 
	somewhere plausible when line is justified."
	| _gsSqueakTemp_pad _gsSqueakTemp_extraPad |
	internalSpaces = 0
		ifTrue: [^ 0].
	_gsSqueakTemp_pad := paddingWidth // internalSpaces.
	_gsSqueakTemp_extraPad := paddingWidth \\ internalSpaces.
	spaceIndex <= _gsSqueakTemp_extraPad
		ifTrue: [^ spaceIndex * (_gsSqueakTemp_pad + 1)]
		ifFalse: [^ _gsSqueakTemp_extraPad * (_gsSqueakTemp_pad + 1) + (spaceIndex - _gsSqueakTemp_extraPad * _gsSqueakTemp_pad)]