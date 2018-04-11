private
ifNoTransformWithIn: box 
	"Return true if the current transformation does not affect the given
	bounding box"
	| _gsSqueakTemp_delta |
	transform
		ifNil: [^ true].
	_gsSqueakTemp_delta := (transform localPointToGlobal: box origin)
				- box origin.
	^ (transform localPointToGlobal: box corner)
		- box corner = _gsSqueakTemp_delta