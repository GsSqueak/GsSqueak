drawing
paragraph: para bounds: bounds color: c 
	| displayablePara |
	self comment:'paragraph with bounds: ' with:bounds.
	displayablePara := para asParagraphForPostscript.
	self preserveStateDuring:
		[:inner |
		displayablePara displayOn: inner
			using: (PostscriptCharacterScanner
					scannerWithCanvas: self paragraph: displayablePara bounds: bounds)
			at: bounds topLeft]
