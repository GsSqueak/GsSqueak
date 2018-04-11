interface
classNamed: className

	| query output |
	query := self codeReferencingMe , ' classNamed: ' , className printString.
	output := self session run: query.
	^ output first = 'nil'
		ifTrue: [nil]
		ifFalse: [self classProxyNamed: className]