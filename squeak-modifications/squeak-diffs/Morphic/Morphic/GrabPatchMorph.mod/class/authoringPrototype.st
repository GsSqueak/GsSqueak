instance creation
authoringPrototype
	"Answer a prototype for use in a parts bin"

	^ self new image: (ScriptingSystem formAtKey: 'GrabPatch'); markAsPartsDonor; setBalloonText: 'Use this to grab a rectangular patch from the screen'; yourself