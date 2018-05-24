file in/out
bumpVersion: versionNumber
	"Make a new version after the previous version number"
	versionNumber ifNil:[^0].
	^versionNumber + 1