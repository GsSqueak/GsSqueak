private events
generateDropFilesEvent: evtBuf 
	"Generate the appropriate mouse event for the given raw event buffer"
	"Note: This is still in an experimental phase and will need more work"
	| _gsSqueakTemp_position _gsSqueakTemp_buttons _gsSqueakTemp_modifiers _gsSqueakTemp_stamp _gsSqueakTemp_numFiles _gsSqueakTemp_dragType |
	_gsSqueakTemp_stamp := evtBuf second.
	_gsSqueakTemp_stamp = 0
		ifTrue: [_gsSqueakTemp_stamp := Time eventMillisecondClock].
	_gsSqueakTemp_dragType := evtBuf third.
	_gsSqueakTemp_position := evtBuf fourth @ evtBuf fifth.
	_gsSqueakTemp_buttons := 0.
	_gsSqueakTemp_modifiers := evtBuf sixth.
	_gsSqueakTemp_buttons := _gsSqueakTemp_buttons
				bitOr: (_gsSqueakTemp_modifiers bitShift: 3).
	_gsSqueakTemp_numFiles := evtBuf seventh.
	_gsSqueakTemp_dragType = 4
		ifTrue: ["e.g., drop"
			owner borderWidth: 0.
			^ DropFilesEvent new
				setPosition: _gsSqueakTemp_position
				contents: _gsSqueakTemp_numFiles
				hand: self].
	"the others are currently not handled by morphs themselves"
	_gsSqueakTemp_dragType = 1
		ifTrue: ["experimental drag enter"
			owner borderWidth: 4;
				 borderColor: owner color asColor negated].
	_gsSqueakTemp_dragType = 2
		ifTrue: ["experimental drag move"
			].
	_gsSqueakTemp_dragType = 3
		ifTrue: ["experimental drag leave"
			owner borderWidth: 0].
	^ nil