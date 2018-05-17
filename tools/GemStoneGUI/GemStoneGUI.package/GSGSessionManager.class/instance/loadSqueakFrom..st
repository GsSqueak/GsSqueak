button actions
loadSqueakFrom: aFileDirectory

	| loader |
	loader := GSSClassDiffs fromDirectory: aFileDirectory.
	loader installInto: (GSGSqueakEnvironmentProxy forSession: self session)