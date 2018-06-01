support
dispatchEvent: anEvent toSubmorphsOf: aMorph 
	"Dispatch the given event to the submorphs of the given morph. For
	coordinate transformations, work only with copies. Either return the
	given event or a copy of any filtered event to employ immutability to
	some extent. --- PRIVATE!"
	| _gsSqueakTemp_localEvent _gsSqueakTemp_filteredEvent |
	aMorph
		submorphsDo: [:child | 
			_gsSqueakTemp_localEvent := anEvent
						transformedBy: (child transformedFrom: aMorph).
			_gsSqueakTemp_filteredEvent := child processEvent: _gsSqueakTemp_localEvent using: self.
			"use same dispatcher"
			_gsSqueakTemp_filteredEvent == #rejected
				ifFalse: ["some event or #rejected symbol"
					self flag: #overlappingChildren.
					"mt: We cannot give two overlapping siblings the
					chance to handle the event!"
					^ self
						nextFromOriginal: anEvent
						local: _gsSqueakTemp_localEvent
						filtered: _gsSqueakTemp_filteredEvent]].
	^ #rejected