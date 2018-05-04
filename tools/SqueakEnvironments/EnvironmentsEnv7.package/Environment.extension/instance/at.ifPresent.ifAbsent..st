*EnvironmentsEnv7-emulating
at: aSymbol ifPresent: presentBlock ifAbsent: absentBlock 
	^ declarations
		at: aSymbol
		ifPresent: presentBlock
		ifAbsent: absentBlock
