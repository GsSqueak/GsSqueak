compiled methods
tempCountOfMethodHeader: header
	<inline: true>
	^ (header >> 19) bitAnd: 16r3F