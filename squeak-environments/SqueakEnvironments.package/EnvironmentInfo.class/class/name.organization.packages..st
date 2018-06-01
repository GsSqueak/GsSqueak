create
name: aString organization: aSystemOrganizer packages: aPackageOrganizer 
	^ self basicNew
		initializeWithName: aString
		organization: aSystemOrganizer
		packages: aPackageOrganizer