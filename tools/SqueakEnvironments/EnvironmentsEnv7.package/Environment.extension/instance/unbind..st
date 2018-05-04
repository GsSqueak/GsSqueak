*EnvironmentsEnv7-binding
unbind: aSymbol 
	| _gsSqueakTemp_binding |
	_gsSqueakTemp_binding := declarations
				bindingOf: aSymbol
				ifAbsent: [^ self].
	undeclared declare: aSymbol from: declarations.
	declarations
		removeKey: aSymbol
		ifAbsent: [].
	[undeclared at: aSymbol put: nil]
		on: AttemptToWriteReadOnlyGlobal
		do: [:n | n resume: true].
	self binding: _gsSqueakTemp_binding removedFrom: self
