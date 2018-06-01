initialization
setSuffixes: aList
	self fileSelectionBlock:  [:entry :myPattern |
			entry isDirectory
				ifTrue:
					[false]
				ifFalse:
					[aList includes: (FileDirectory extensionFor: entry name asLowercase)]]