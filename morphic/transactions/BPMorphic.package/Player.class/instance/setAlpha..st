slot getters/setters
setAlpha: alpha 
	"Set the alpha of the color of my costume."
	| _gsSqueakTemp_adjusted |
	_gsSqueakTemp_adjusted := (alpha max: 0.0)
				min: 1.0.
	^ self
		setColor: (self getColor alpha: _gsSqueakTemp_adjusted)