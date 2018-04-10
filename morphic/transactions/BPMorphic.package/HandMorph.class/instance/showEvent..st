events-debugging
showEvent: anEvent 
	"Show details about the event on the display form. Useful for
	debugging. "
	| _gsSqueakTemp_message _gsSqueakTemp_borderWidth |
	ShowEvents == true
		ifFalse: [^ self].
	_gsSqueakTemp_borderWidth := 5.
	_gsSqueakTemp_message := String
				streamContents: [:strm | strm nextPutAll: '[HandMorph >> #showEvent:]';
						 cr;
						 nextPutAll: 'event';
						 tab;
						 tab;
						 tab;
						 tab;
						 nextPutAll: anEvent printString;
						 cr;
						 nextPutAll: 'keyboard focus';
						 tab;
						 nextPutAll: self keyboardFocus printString;
						 cr;
						 nextPutAll: 'mouse focus';
						 tab;
						 tab;
						 nextPutAll: self mouseFocus printString].
	_gsSqueakTemp_message := _gsSqueakTemp_message asDisplayText foregroundColor: Color black backgroundColor: Color white.
	"Offset to support multiple hands debugging."
	Display
		fill: (0 @ 0 extent: _gsSqueakTemp_message form extent + (_gsSqueakTemp_borderWidth asPoint * 2))
		rule: Form over
		fillColor: Color white.
	_gsSqueakTemp_message displayOn: Display at: _gsSqueakTemp_borderWidth asPoint + (0 @ ((owner hands indexOf: self)
					- 1 * _gsSqueakTemp_message form height))