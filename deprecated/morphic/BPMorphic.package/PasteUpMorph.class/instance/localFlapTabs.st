flaps
localFlapTabs
	"Answer a list of local flap tabs in the current project"
	| globalList aList |
	globalList := Flaps globalFlapTabsIfAny.
	aList := OrderedCollection new.
	submorphs
		do: [:m | | aFlapTab | (m isFlapTab
					and: [(globalList includes: m) not])
				ifTrue: [aList add: m]
				ifFalse: [(m isFlap
							and: [(aFlapTab := m submorphs
											detect: [:n | n isFlapTab]
											ifNone: []) notNil])
						ifTrue: [aList add: aFlapTab]]].
	^ aList