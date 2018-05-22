button actions
loadSqueakFrom: aFileDirectory

	| loader |
	loader := GSSClassDiffs fromDirectory: aFileDirectory.
	loader installInto: (GSGGsSqueakEnvironmentProxy forRepository: self session)