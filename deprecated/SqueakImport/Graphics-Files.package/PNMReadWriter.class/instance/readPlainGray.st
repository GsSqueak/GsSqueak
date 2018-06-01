reading
readPlainGray
	"plain gray"
	| val form poker aux tokens |
	form := Form extent: cols@rows depth: depth.
	poker := BitBlt bitPokerToForm: form.
	tokens := OrderedCollection new.
	0 to: rows-1 do: [:y |
		0 to: cols-1 do: [:x |
			aux := self getTokenPbm: tokens.
			val := aux at: 1. tokens := aux at: 2.
			poker pixelAt: x@y put: val.
		]
	].
	^form
