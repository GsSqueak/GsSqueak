instance creation
authoringPrototype
	"Answer a prototype  for use in a parts bin"

	^ self new image: (ScriptingSystem formAtKey: 'Lasso'); markAsPartsDonor; setBalloonText: 'Drop this on the desktop and you can then grab a patch from the screen with a lasso.'; yourself