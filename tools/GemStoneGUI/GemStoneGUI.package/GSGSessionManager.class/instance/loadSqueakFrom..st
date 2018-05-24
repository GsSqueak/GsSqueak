button actions
loadSqueakFrom: aFileDirectory

	| loader |
	loader := GsSqueak fromDirectory: aFileDirectory.
	loader installInto: (GSGGsSqueakEnvironmentProxy forRepository: self session)