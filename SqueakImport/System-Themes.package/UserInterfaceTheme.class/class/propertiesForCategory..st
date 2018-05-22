tools
propertiesForCategory: categoryName
	^ self allThemeProperties select: [ : each | each third = categoryName ]