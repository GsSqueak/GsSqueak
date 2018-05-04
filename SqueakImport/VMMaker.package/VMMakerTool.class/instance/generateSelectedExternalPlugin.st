generate sources
generateSelectedExternalPlugin

	| plugin |
	plugin := self externalModules at: self currentExternalModuleIndex ifAbsent: [^self].
	self checkOK
		ifTrue: [[vmMaker generateExternalPlugin: plugin]
		on: VMMakerException
		do: [:ex| self inform: ex messageText]]
