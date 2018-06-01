other
fromRGBString: rgb
	"Do not call this method directly, call Color>>#fromString: instead as it is more generic"
	
	| green red blue |
	red := (Integer readFrom:(rgb at: 1)) min: 255 max: 0.
	green := (Integer readFrom:(rgb at: 2)) min: 255 max: 0.
	blue := (Integer readFrom:(rgb at: 3)) min: 255 max: 0.
	^self r: red g: green b: blue range: 255