as yet unclassified
drawWindow: aWindow contents: aBitmap
	<messageSendsInEnv: 0>
	drawWindowCo
		callWith: {
			aWindow.
			aBitmap asCByteArray }
