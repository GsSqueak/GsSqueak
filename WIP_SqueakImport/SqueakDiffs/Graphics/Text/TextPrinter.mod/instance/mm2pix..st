other
mm2pix: aPoint
	"Convert aPoint from millimeters to actual pixels"
	^self in2pix: (self mm2in: aPoint)