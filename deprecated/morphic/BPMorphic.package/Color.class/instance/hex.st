conversions
hex
	^ ((self red * 255) asInteger printPaddedWith: $0 to: 2 base: 16) ,
	  ((self green * 255) asInteger printPaddedWith: $0 to: 2 base: 16) ,
	  ((self blue * 255) asInteger printPaddedWith: $0 to: 2 base: 16).