caching
releaseCachedState

	super releaseCachedState.
	sound isCompressed
		ifFalse: [sound := sound compressWith: GSMCodec].
