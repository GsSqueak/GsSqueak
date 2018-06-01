events-processing
processFocusEvent: anEvent using: defaultDispatcher
	"Event dispatching shortcut."

	^ defaultDispatcher dispatchFocusEvent: anEvent with: self