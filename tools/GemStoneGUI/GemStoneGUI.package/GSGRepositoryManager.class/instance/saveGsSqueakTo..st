GsSqueak
saveGsSqueakTo: aFileDirectory

	| saver |
	saver := GsSqueak fromDirectory: aFileDirectory.
	saver saveFrom: (GSGGsSqueakEnvironmentProxy forRepository: self repository)