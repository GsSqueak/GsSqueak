drawing
drawSubmorphsOn: aCanvas 
	| _gsSqueakTemp_alpha |
	(_gsSqueakTemp_alpha := self magicAlpha) = 1.0
		ifTrue: [^ super drawSubmorphsOn: aCanvas].
	^ super
		drawSubmorphsOn: (aCanvas asAlphaBlendingCanvas: _gsSqueakTemp_alpha)