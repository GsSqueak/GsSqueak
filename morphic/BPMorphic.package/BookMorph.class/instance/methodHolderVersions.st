scripting
methodHolderVersions
	"Create lists of times of older versions of all code in MethodMorphs in
	this book."
	| _gsSqueakTemp_arrayOfVersions _gsSqueakTemp_vTimes |
	_gsSqueakTemp_arrayOfVersions := MethodHolders
				collect: [:mh | mh versions].
	"equality, hash for MethodHolders?"
	_gsSqueakTemp_vTimes := OrderedCollection new.
	_gsSqueakTemp_arrayOfVersions
		do: [:versionBrowser | versionBrowser changeList
				do: [:cr | | strings | (strings := cr stamp findTokens: ' ') size > 2
						ifTrue: [_gsSqueakTemp_vTimes add: strings second asDate asSeconds + strings third asTime asSeconds]]].
	VersionTimes := Time condenseBunches: _gsSqueakTemp_vTimes.
	VersionNames := Time namesForTimes: VersionTimes