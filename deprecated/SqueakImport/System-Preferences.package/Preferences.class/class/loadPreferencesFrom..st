initialization - save/load
loadPreferencesFrom: aFile
	| stream params dict desktopColor |
	stream := ReferenceStream fileNamed: aFile.
	params := stream next.
	self assert: (params isKindOf: IdentityDictionary).
	params removeKey: #PersonalDictionaryOfPreferences.
	dict := stream next.
	self assert: (dict isKindOf: IdentityDictionary).
	desktopColor := stream next.
	stream close.
	dict keysAndValuesDo:
		[:key :value | (self preferenceAt: key ifAbsent: [nil]) ifNotNil:
			[:pref | [pref preferenceValue: value preferenceValue] on: Error do: [ : err | "Ignore preferences which may not be supported anymore."]]].
	params keysAndValuesDo: [ :key :value | self setParameter: key to: value ].
	Smalltalk isMorphic
		ifTrue: [ Project current world fillStyle: desktopColor ]
		ifFalse: [ self desktopColor: desktopColor. ScheduledControllers updateGray ]