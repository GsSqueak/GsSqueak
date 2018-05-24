menu messages
assureNavigatorPresenceMatchesPreference
	"Make sure that the current project conforms to the presence/absence of the navigator"

	| navigator navType wantIt |
	wantIt :=  Preferences classicNavigatorEnabled and: [Preferences showProjectNavigator].
	navType := ProjectNavigationMorph preferredNavigator.
	navigator := world findA: navType.
	wantIt
		ifFalse:
			[navigator ifNotNil: [navigator delete]]
		ifTrue:
			[navigator isNil ifTrue: 
				[(navigator := navType new)
					bottomLeft: world bottomLeft;
					openInWorld: world]]