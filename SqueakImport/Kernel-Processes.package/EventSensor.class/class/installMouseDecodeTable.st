class initialization
installMouseDecodeTable
	"Create a decode table that swaps the lowest-order 2 bits if 
	Preferences swapMouseButtons is set"
	ButtonDecodeTable := Preferences swapMouseButtons
				ifTrue: [ByteArray withAll:
							((0 to: 255) collect: [:ea |
								((ea bitAnd: 1) << 1
									bitOr: (ea bitAnd: 2) >> 1)
										bitOr: (ea bitAnd: 16rFC) ])]
				ifFalse: [ByteArray
						withAll: (0 to: 255)]