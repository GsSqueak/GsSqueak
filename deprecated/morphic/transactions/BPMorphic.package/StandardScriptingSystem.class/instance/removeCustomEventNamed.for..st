-Etoys-customevents-custom events
removeCustomEventNamed: aSymbol for: registrant 
	| _gsSqueakTemp_registration _gsSqueakTemp_helpString |
	_gsSqueakTemp_registration := self customEventsRegistry
				at: aSymbol
				ifAbsent: [^ nil].
	_gsSqueakTemp_helpString := _gsSqueakTemp_registration
				removeKey: registrant
				ifAbsent: [].
	_gsSqueakTemp_registration isEmpty
		ifTrue: [self customEventsRegistry removeKey: aSymbol].
	^ _gsSqueakTemp_helpString