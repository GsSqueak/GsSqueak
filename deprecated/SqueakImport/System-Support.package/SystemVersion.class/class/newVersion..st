instance creation
newVersion: versionName
	| newVersion |
	
	self assert: (versionName beginsWith: 'Squeak').
	
	newVersion := self new version: versionName.

	self assert: newVersion majorVersionNumber notNil.
	self assert: newVersion minorVersionNumber notNil.
	self assert: newVersion isSqueak.
	
	self assert: (#(isRelease isAlpha isFeatureFreeze isCodeFreeze isReleaseCandidate)
		anySatisfy: [:sel | newVersion perform: sel]).
	
	newVersion highestUpdate: self current highestUpdate.
	Current := newVersion
