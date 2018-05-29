initialize
setWorldBackground: force

	((world hasProperty: #hasCustomBackground) and: [force not])
		ifTrue: [^ self].
	
	Project current ifNil: [
	    ^ self ].

	"If the user has a custom background, propagate it into the new project."
	((Project current ~~ self and: [Project current isMorphic]) and: [Project current world hasProperty: #hasCustomBackground])
		ifTrue: [
			world fillStyle: Project current world fillStyle.
			world setProperty: #hasCustomBackground toValue: true]
		ifFalse: [
			world removeProperty: #hasCustomBackground.
			world fillStyle: (self userInterfaceTheme background ifNil: [self class defaultFill])].
