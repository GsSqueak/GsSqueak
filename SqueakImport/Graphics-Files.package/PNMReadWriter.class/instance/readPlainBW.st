reading
readPlainBW
	"plain BW"
	| val form poker |
	form := Form extent: cols@rows depth: depth.
	poker := BitBlt bitPokerToForm: form.
	0 to: rows-1 do: [:y |
		0 to: cols-1 do: [:x |
			[val := stream next. (val = $0 or:[val = $1])] whileFalse:[
				val ifNil:[self error:'End of file reading PBM'].
			].
			poker pixelAt: x@y put: (val asInteger).
		]
	].
	^form
