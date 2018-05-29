*System-Object Events-accessing-removing
removeActionsWithReceiver: anObject

	self actionMap copy keysDo:
		[:eachEventSelector |
			self
   				removeActionsSatisfying: [:anAction | anAction receiver == anObject]
				forEvent: eachEventSelector
		]