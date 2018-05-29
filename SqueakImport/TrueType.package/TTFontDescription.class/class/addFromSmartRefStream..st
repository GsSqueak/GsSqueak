instance creation
addFromSmartRefStream: ref

	| tts |
	tts := ref nextAndClose.

	^ tts collect: [:tt |
		self addToDescription: tt.
	].
