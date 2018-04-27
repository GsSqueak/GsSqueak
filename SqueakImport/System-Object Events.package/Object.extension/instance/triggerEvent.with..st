*System-Object Events-accessing-triggering
triggerEvent: anEventSelector
with: anObject

    ^self 
		triggerEvent: anEventSelector
		withArguments: (Array with: anObject)