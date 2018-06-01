file in/out
storeSegmentNoFile
	"For testing.  Make an ImageSegment.  Keep the outPointers in memory.  Also useful if you want to enumerate the objects in the segment afterwards (allObjectsDo:)"

	| is currentWorld |
	currentWorld := Project current world.
	(currentWorld == world) ifTrue: [^ self].		" inform: 'Can''t send the current world out'."
	world isInMemory ifFalse: [^ self].  "already done"
	world ifNil: [^ self].  world presenter ifNil: [^ self].

	"Do this on project enter"
	currentWorld flapTabs do: [:ft | ft referent adaptToWorld: currentWorld].
		"Hack to keep the Menu flap from pointing at my project"
	"Preferences setPreference: #useGlobalFlaps toValue: false."
	"Utilities globalFlapTabsIfAny do:
		[:aFlapTab | Utilities removeFlapTab: aFlapTab keepInList: false].
	Utilities clobberFlapTabList.	"
	"project world deleteAllFlapArtifacts."
	"self currentWorld deleteAllFlapArtifacts.	"
	ScrapBook default emptyScrapBook.
	currentWorld checkCurrentHandForObjectToPaste2.

	is := ImageSegment
			copyFromRootsLocalFileFor: {world presenter. world}	"world, and all Players"
			sizeHint: 0.

	is segment size < 800 ifTrue: ["debugging" 
		Transcript show: self name, ' did not get enough objects'; cr.  ^ Beeper beep].

	is extract.
	"is instVarAt: 2 put: is segment clone."		"different memory"