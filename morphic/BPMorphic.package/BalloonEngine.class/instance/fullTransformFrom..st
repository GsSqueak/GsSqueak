accessing
fullTransformFrom: aMatrix 
	| _gsSqueakTemp_m |
	_gsSqueakTemp_m := self aaTransform composedWith: aMatrix.
	"m offset: m offset + destOffset."
	^ _gsSqueakTemp_m