change logging
noteNewMethod: newMethod forClass: class selector: selector priorMethod: methodOrNil

	class wantsChangeSetLogging ifFalse: [^ self].
	isolationSet ifNotNil:
		["If there is an isolation layer above me, inform it as well."
		isolationSet noteNewMethod: newMethod forClass: class selector: selector
				priorMethod: methodOrNil].
	(self changeRecorderFor: class)
		noteNewMethod: newMethod selector: selector priorMethod: methodOrNil
