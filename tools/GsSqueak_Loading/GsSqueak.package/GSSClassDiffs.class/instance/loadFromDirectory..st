initialization
loadFromDirectory: aFileDirectory

	self loadSqueakClassesFrom: aFileDirectory.
	self loadClassesFromDirectory: aFileDirectory.