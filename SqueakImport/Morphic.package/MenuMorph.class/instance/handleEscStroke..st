keystroke helpers
handleEscStroke: evt

	evt keyValue = 27 ifFalse: [ ^false ].
	self 
		valueOfProperty: #matchString
		ifPresentDo: [ :str | 
			str isEmpty ifFalse: [ "If filtered, first ESC removes filter"
				self setProperty: #matchString toValue: String new.
				self selectItem: nil event: evt.
				self displayFiltered: evt.
				^true ] ].
	self deactivate: evt.
	^true