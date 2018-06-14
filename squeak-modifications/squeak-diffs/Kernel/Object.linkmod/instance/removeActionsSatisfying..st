*System-Object Events-accessing-removing
removeActionsSatisfying: aBlock

	self actionMap keys do:
		[:eachEventSelector |
			self
   				removeActionsSatisfying: aBlock
				forEvent: eachEventSelector
		]