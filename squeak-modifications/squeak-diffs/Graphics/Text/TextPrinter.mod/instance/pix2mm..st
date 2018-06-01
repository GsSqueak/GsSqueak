other
pix2mm: aPoint
	"Convert aPoint from a pixel value to millimeters"
	^self in2mm: (self pix2in: aPoint)