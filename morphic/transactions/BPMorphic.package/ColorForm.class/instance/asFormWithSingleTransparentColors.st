postscript generation
asFormWithSingleTransparentColors
	| _gsSqueakTemp_transparentIndexes |
	_gsSqueakTemp_transparentIndexes := self transparentColorIndexes.
	_gsSqueakTemp_transparentIndexes size <= 1
		ifTrue: [^ self]
		ifFalse: [^ self mapTransparencies: _gsSqueakTemp_transparentIndexes]