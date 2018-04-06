initializing
initializeWithName: aString organization: aSystemOrganizer packages: aPackageOrganizer 
	self initialize.
	name := aString asSymbol.
	organization := aSystemOrganizer.
	packages := aPackageOrganizer