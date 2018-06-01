scripting
authoringPrototype
	^ self new image: (ScriptingSystem formAtKey: 'Painting'); markAsPartsDonor; setBalloonText: 'drop this into any playfield or book page to make a new painting there'; yourself