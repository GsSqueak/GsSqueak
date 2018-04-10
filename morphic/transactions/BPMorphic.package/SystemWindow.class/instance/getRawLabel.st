label
getRawLabel
	| _gsSqueakTemp_contentsFit |
	_gsSqueakTemp_contentsFit := label duplicate fitContents.
	_gsSqueakTemp_contentsFit extent: (label extent x min: _gsSqueakTemp_contentsFit extent x)
			@ _gsSqueakTemp_contentsFit extent y.
	^ _gsSqueakTemp_contentsFit