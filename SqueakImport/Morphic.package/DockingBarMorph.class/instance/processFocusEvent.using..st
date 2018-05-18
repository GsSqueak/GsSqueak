events-processing
processFocusEvent: evt using: dispatcher

	^ dispatcher dispatchFocusEventFully: evt with: self