events
doubleClick: event 
	| _gsSqueakTemp_index |
	doubleClickSelector
		ifNil: [^ super doubleClick: event].
	_gsSqueakTemp_index := self rowAtLocation: event position.
	_gsSqueakTemp_index = 0
		ifTrue: [^ super doubleClick: event].
	"selectedMorph ifNil: [self setSelectedMorph: aMorph]."
	^ self model perform: doubleClickSelector