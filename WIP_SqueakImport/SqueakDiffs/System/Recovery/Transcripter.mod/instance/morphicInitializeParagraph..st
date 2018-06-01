*Morphic
morphicInitializeParagraph: classParagraph
	para := classParagraph new.
	para compose: self contents asText
		style: TextStyle default
		from: 1
		in: frame
