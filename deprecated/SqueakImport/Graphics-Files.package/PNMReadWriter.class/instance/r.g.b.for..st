reading
r: r g: g b: b for: aDepth
	"integer value according depth"
	| val |
	aDepth = 16 ifTrue: [
		val := (1 << 15) + (r << 10) + (g << 5) + b.
	]
	ifFalse:[
		val := (16rFF << 24) + (r << 16) + (g << 8) + b.
	].
	^val
