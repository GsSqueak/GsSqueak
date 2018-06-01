menu messages
setAlignment: aSymbol
	| attr interval |
	attr := TextAlignment perform: aSymbol.
	interval := self encompassLine: self selectionInterval.
	paragraph 
		replaceFrom: interval first 
		to: interval last 
		with: ((paragraph text copyFrom: interval first to: interval last) addAttribute: attr)