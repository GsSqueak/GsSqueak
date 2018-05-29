scripting
methodHolderVersions
	| arrayOfVersions vTimes |
	"Create lists of times of older versions of all code in MethodMorphs in this book."

	arrayOfVersions := MethodHolders collect: [:mh | 
		mh versions].	"equality, hash for MethodHolders?"
	vTimes := OrderedCollection new.
	arrayOfVersions do: [:versionBrowser |  
		versionBrowser changeList do: [:cr | | strings | 
			(strings := cr stamp findTokens: ' ') size > 2 ifTrue: [
				vTimes add: strings second asDate asSeconds + 
						strings third asTime asSeconds]]].
	VersionTimes := Time condenseBunches: vTimes.
	VersionNames := Time namesForTimes: VersionTimes.
