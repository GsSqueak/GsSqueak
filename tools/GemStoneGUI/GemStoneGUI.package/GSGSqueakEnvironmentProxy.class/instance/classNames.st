interface
classNames

	| query output |
	query := self codeForPrintingListCreatedBy: 
				self codeReferencingMe , ' classNames'.
	output := self session run: query.
	^ self convertToSymbolList: output first