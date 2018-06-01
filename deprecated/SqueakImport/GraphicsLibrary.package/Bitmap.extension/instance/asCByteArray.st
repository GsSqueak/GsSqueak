*GraphicsLibrary
asCByteArray
	<messageSendsInEnv: 0>
	| wordCount cByteArray |
	wordCount := self _env7 size.
	cByteArray := (GemstoneSmalltalk at: #CByteArray) gcMalloc: wordCount * 4.
	1 to: wordCount do: [:index |
		cByteArray uint32At: (index - 1) * 4 put: (self _env7 at: index)].
	^ cByteArray
