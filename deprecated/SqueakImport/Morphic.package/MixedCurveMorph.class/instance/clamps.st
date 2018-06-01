access
clamps
" Return a collection of clamps the same size as vertices.
	If necessary default to unclamped slopes.
"

slopeClamps 
	ifNil:   [ ^ slopeClamps := Array new: vertices size  ] .
slopeClamps size = vertices size
	ifFalse: [ ^ slopeClamps := Array new: vertices size  ] . 
	^ slopeClamps           