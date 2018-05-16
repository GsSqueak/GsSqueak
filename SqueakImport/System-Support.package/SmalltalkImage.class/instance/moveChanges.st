housekeeping
moveChanges
	"Move the current version of every method in .changes to my .sources file."
	self appendChangesTo:
		((UIManager default
			request: 'Please specify the name of the\.sources file to move changes to.' withCRs
			initialAnswer: self sourceFileVersionString) ifEmpty: [ ^ self inform: 'Aborted.' ])