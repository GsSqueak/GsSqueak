track reading
trackContainsNotes: eventList
	"Answer true if the given track contains at least one note event."

	eventList do: [:e | e isNoteEvent ifTrue: [^ true]].
	^ false
