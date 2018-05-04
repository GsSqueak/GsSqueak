generate sources
generateSelectedInternalPlugin

	| plugin |
	plugin := self internalModules at: self currentInternalModuleIndex ifAbsent: [^self].
	self checkOK
		ifTrue: [[vmMaker generateInternalPlugin: plugin]
		on: VMMakerException
		do: [:ex| self inform: ex messageText]]
