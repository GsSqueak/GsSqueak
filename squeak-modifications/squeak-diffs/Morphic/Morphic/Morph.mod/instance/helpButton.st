menus
helpButton
	"Answer a button whose action would be to put up help concerning the receiver"

	| aButton |
	aButton := SimpleButtonMorph new.
	aButton
		target: self;
		color: Color lightGreen;
		borderColor: Color lightGreen muchDarker;
		borderWidth: 1;
		label: '?' translated font: Preferences standardButtonFont;
		actionSelector: #presentHelp;
		setBalloonText: 'click here for help' translated.
	^ aButton