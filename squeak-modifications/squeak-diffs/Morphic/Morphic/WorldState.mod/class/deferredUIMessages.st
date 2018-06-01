class initialization
deferredUIMessages

	^DeferredUIMessages ifNil: [DeferredUIMessages := SharedQueue new].
