as yet unclassified
instance
	| sessionTemps |
	sessionTemps := GemstoneSmalltalk _env0 at: #SessionTemps.
	^ sessionTemps _env0 current _env0 at: #'GraphicsLibraryInstance' ifAbsentPut: [self new ]
