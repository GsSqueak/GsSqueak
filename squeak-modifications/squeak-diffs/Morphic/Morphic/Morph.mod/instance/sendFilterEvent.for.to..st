events-processing
sendFilterEvent: anEvent for: anObject to: filterGroup
	"An event gets filtered if some event filter wants to filter it."
	
	| filteredEvent |
	filterGroup ifNil: [^anEvent].

	filteredEvent := anEvent.
	filterGroup do: [:filterOrNil | filterOrNil ifNotNil: [:filter |
		filteredEvent := filter filterEvent: filteredEvent for: anObject]].
	
	^ filteredEvent