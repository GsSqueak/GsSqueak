support
dispatchEvent: anEvent toSubmorphsOf: aMorph
	"Dispatch the given event to the submorphs of the given morph. For coordinate transformations, work only with copies. Either return the given event or a copy of any filtered event to employ immutability to some extent. --- PRIVATE!"

	| localEvent filteredEvent |	
	aMorph submorphsDo: [:child |
		localEvent := anEvent transformedBy: (child transformedFrom: aMorph).
		filteredEvent := child
			processEvent: localEvent
			using: self. "use same dispatcher"
		filteredEvent == #rejected ifFalse: [ "some event or #rejected symbol"
			self flag: #overlappingChildren. "mt: We cannot give two overlapping siblings the chance to handle the event!"	
			^ self nextFromOriginal: anEvent local: localEvent filtered: filteredEvent]].

	^ #rejected