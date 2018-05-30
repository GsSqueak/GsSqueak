reading
readRGB
	"RGB form, use 16/32 bits"
	| val form poker sample shift |
	maxValue > 255 ifTrue:[self error:'RGB value > 32 bits not supported in Squeak'].
	stream binary.
	form := Form extent: cols@rows depth: depth.
	poker := BitBlt bitPokerToForm: form.
	depth = 32 ifTrue:[shift := 8] ifFalse:[shift := 5].
	0 to: rows-1 do: [:y |
		0 to: cols-1 do: [:x |
			val := 16rFF.	"no transparency"
			1 to: 3 do: [:i |
				sample := stream next.
				val := val << shift + sample.
			].
			poker pixelAt: x@y put: val.
		]
	].
	^form
