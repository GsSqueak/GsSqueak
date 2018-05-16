snapshot and quit
snapshot: save andQuit: quit embedded: embeddedFlag

	^self	
		snapshot: save
		andQuit: quit
		withExitCode: nil
		embedded: embeddedFlag