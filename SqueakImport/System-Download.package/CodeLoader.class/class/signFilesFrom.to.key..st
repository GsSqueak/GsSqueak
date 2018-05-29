utilities
signFilesFrom: sourceNames to: destNames key: privateKey
	"Sign all the given files using the private key.
	This will add an 's' to the extension of the file."
	"| fd oldNames newNames |
	fd := FileDirectory default directoryNamed:'unsigned'.
	oldNames := fd fileNames.
	newNames := oldNames collect:[:name| 'signed', FileDirectory slash, name].
	oldNames := oldNames collect:[:name| 'unsigned', FileDirectory slash, name].
	CodeLoader
		signFilesFrom: oldNames
		to: newNames
		key: DOLPrivateKey."
	| dsa |
	dsa := DigitalSignatureAlgorithm new.
	dsa initRandomNonInteractively.
	'Signing files...' 
		displayProgressFrom: 1 to: sourceNames size during:[:bar|
			1 to: sourceNames size do:[:i|
				bar value: i.
				self signFile: (sourceNames at: i) renameAs: (destNames at: i) key: privateKey dsa: dsa]].
