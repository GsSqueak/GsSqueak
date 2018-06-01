flap mechanics
removeFlapTab: aFlapTab keepInList: aBoolean
	"Remove the given flap tab from the screen, and, if aBoolean is true, also from the global list"

	(SharedFlapTabs ~~ nil and: [SharedFlapTabs includes: aFlapTab])
		ifTrue:
			[aBoolean ifFalse: [self removeFromGlobalFlapTabList: aFlapTab]].
	aFlapTab ifNotNil:
		[aFlapTab referent delete.
		aFlapTab delete]