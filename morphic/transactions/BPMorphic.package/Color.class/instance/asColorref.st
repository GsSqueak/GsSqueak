conversions
asColorref
	"Convert the receiver into a colorref"
	^ (self red * 255) rounded + ((self green * 255) rounded << 8) + ((self blue * 255) rounded << 16)