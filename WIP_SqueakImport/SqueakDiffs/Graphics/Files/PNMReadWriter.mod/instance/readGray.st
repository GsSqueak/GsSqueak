reading
readGray
	"gray form, return ColorForm with gray ramp"
	| form poker |
	maxValue > 255 ifTrue:[self error:'Gray value > 8 bits not supported in Squeak'].
	stream binary.
	form := ColorForm extent: cols@rows depth: depth.
	form colors: nil.
	poker := BitBlt bitPokerToForm: form.
	0 to: rows-1 do: [:y |
		0 to: cols-1 do: [:x |
			|val|
			val := stream next.
			poker pixelAt: x@y put: val.
		]
	].
	"a better way is using a gamma corrected palette"
	form colors: ((0 to: 255) collect:[:c|
		c > maxValue
			ifTrue:[Color white]
			ifFalse:[Color gray: (c/maxValue) asFloat]]).
	form colors at: 1 put: (Color black).
	^form
