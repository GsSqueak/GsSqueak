initialization - save/load
storePreferencesIn: aFileName 
	| stream prefsSnapshot |
	#(Prevailing PersonalPreferences) do:
		[:ea |
		 Parameters removeKey: ea ifAbsent: []].
	stream := ReferenceStream fileNamed: aFileName.
	stream nextPut: Parameters.
	prefsSnapshot := preferencesDictionary copy.
	prefsSnapshot keysAndValuesDo: [:key :pref | prefsSnapshot at: key put: pref asPreference].
	stream nextPut: prefsSnapshot.
	stream nextPut: (Smalltalk isMorphic 
						 ifTrue:[Project current world fillStyle]
						 ifFalse:[self desktopColor]).
	stream close