message sending
handleSpecialSelectorSendFaultFor: obj 
	^ self
		handleSpecialSelectorSendFaultFor: obj
		fp: localFP
		sp: localSP