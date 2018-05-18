reading
readBWreverse: flagXor
	"B&W for PAM"
	| val form bytesRow nBytes |
	stream binary.
	form := Form extent: cols@rows depth: 1.
	nBytes := (cols/8) ceiling.
	bytesRow := (cols/32) ceiling * 4.
	0 to: rows-1 do: [:y | | i |
		i := 1 + (bytesRow*y).
		0 to: nBytes-1 do: [:x |
			val := stream next.
			flagXor ifTrue:[val := val bitXor: 16rFF].
			form bits byteAt: i put: val.
			i := i+1.
		]
	].
	^form
