interface
classNames

	| query |
	query := (self codeForClassOrganizerInEnv: 0) , ' classes collect: [:class | class name]'.
	^ (self repository fetchArrayOfSymbols: query) sort