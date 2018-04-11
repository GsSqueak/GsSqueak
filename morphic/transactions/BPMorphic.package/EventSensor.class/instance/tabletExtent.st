tablet
tabletExtent
	"Answer the full tablet extent in tablet coordinates."
	| _gsSqueakTemp_params |
	_gsSqueakTemp_params := self primTabletGetParameters: 1.
	_gsSqueakTemp_params
		ifNil: [^ self error: 'no tablet available'].
	^ (_gsSqueakTemp_params at: 1)
		@ (_gsSqueakTemp_params at: 2)