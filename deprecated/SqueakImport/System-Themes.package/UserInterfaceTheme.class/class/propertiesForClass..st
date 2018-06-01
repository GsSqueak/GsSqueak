tools
propertiesForClass: aClass
	^ self allThemeProperties select: [ : each | each first = aClass ]