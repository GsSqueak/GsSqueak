other
in2pix: aPoint
	"Convert aPoint from inches to actual pixels"
	^(aPoint * self resolution) rounded