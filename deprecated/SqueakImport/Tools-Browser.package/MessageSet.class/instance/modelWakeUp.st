user interface
modelWakeUp
	"A window with me as model has been activated."

	super modelWakeUp.
	(self canDiscardEdits and: [autoSelectString notNil]) ifTrue: [
		self codeTextMorph ifNotNil: [:tm |
			(tm hasProperty: #launched) ifFalse: [
				tm scrollSelectionIntoView.
				tm setProperty: #launched toValue: true] ] ]