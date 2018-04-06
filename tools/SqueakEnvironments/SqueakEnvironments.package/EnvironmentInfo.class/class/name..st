create
name: aString 
	^ self
		name: aString
		organization: (SystemOrganizer defaultList: Array new)
		packages: PackageOrganizer new