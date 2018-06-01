e-toy support
asNumber: aPointOrNumber 
	"Support for e-toy demo."
	aPointOrNumber class = Point
		ifTrue: [^ aPointOrNumber r]
		ifFalse: [^ aPointOrNumber]