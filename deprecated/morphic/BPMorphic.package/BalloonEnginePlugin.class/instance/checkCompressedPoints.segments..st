shapes-compressed
checkCompressedPoints: points segments: nSegments 
	"Check if the given point array can be handled by the engine."
	| _gsSqueakTemp_pSize |
	(interpreterProxy isWords: points)
		ifFalse: [^ false].
	_gsSqueakTemp_pSize := interpreterProxy slotSizeOf: points.
	"The points must be either in PointArray format or ShortPointArray
	format. Also, we currently handle only quadratic segments (e.g., 3
	points each) and thus either
	pSize = nSegments * 3,		for ShortPointArrays or,
	pSize = nSegments * 6,		for PointArrays"
	(_gsSqueakTemp_pSize = (nSegments * 3)
			or: [_gsSqueakTemp_pSize = (nSegments * 6)])
		ifFalse: [^ false].
	"Can't handle this"
	^ true