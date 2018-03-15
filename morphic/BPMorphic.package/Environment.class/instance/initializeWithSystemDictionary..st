initialize-release
initializeWithSystemDictionary: old 
	self initialize.
	info := EnvironmentInfo
				name: 'Smalltalk'
				organization: old organization
				packages: PackageOrganizer default.
	old
		associationsDo: [:assc | declarations add: assc].
	(old at: #Undeclared)
		associationsDo: [:assc | undeclared add: assc].
	(declarations at: #Smalltalk)
		instVarNamed: 'globals'
		put: self.
	declarations at: #Undeclared put: undeclared