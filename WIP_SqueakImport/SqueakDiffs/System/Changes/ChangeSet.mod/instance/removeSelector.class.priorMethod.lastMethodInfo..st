change logging
removeSelector: selector class: class priorMethod: priorMethod lastMethodInfo: info
	"Include indication that a method has been forgotten.
	info is a pair of the source code pointer and message category
	for the method that was removed."

	class wantsChangeSetLogging ifFalse: [^ self].
	isolationSet ifNotNil:
		["If there is an isolation layer above me, inform it as well."
		isolationSet removeSelector: selector class: class
				priorMethod: priorMethod lastMethodInfo: info].
	(self changeRecorderFor: class)
		noteRemoveSelector: selector priorMethod: priorMethod lastMethodInfo: info
