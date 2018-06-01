setting
valueProvider
	"Answer the object to which my get/set messages should be sent.  This is inefficient and contorted in order to support grandfathered content for an earlier design"

	^ target isMorph
		ifTrue:
			[target topRendererOrSelf player ifNil: [target]]
		ifFalse:
			[target]