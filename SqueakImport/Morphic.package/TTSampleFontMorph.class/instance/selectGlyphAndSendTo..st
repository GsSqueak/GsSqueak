connectors
selectGlyphAndSendTo: aBlock
	self on: #mouseDown send: #selectGlyphBlock:event:from: to: self withValue: aBlock.