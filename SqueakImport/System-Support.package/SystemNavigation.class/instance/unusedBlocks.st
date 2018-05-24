query
unusedBlocks
	"Answer all methods that contain a block that is not used (not
	 sent a message, returned, passed as an argument, or assigned)."
	"SystemNavigation new unusedBlocks"
	"SystemNavigation new
		browseMessageList: SystemNavigation new unusedBlocks
		name: 'unused blocks'"

	^self allMethodsSelect:
		[:m| | is |
		is := InstructionStream on: m.
		is scanFor: [:b| b = 143 and: [(m at: is thirdByte * 256 + is fourthByte + is pc + 4) = 135]]]