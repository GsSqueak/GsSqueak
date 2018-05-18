reading
readPlainRGB
	"RGB form, use 32 bits"
	| val form poker tokens aux |
	maxValue > 255 ifTrue:[self error:'RGB value > 32 bits not supported in Squeak'].
	form := Form extent: cols@rows depth: 32.
	poker := BitBlt bitPokerToForm: form.
	tokens := OrderedCollection new.
	0 to: rows-1 do: [:y |
		0 to: cols-1 do: [:x | | r g b|
			aux := self getTokenPbm: tokens. r := aux at: 1. tokens := aux at: 2.
			aux := self getTokenPbm: tokens. g := aux at: 1. tokens := aux at: 2.
			aux := self getTokenPbm: tokens. b := aux at: 1. tokens := aux at: 2.
			val := self r: r g: g b: b for: depth.
			poker pixelAt: x@y put: val.
		]
	].
	^form
