-MorphicExtras-menus
dismissButton
	"Answer a button whose action would be to dismiss the receiver, and
	whose action is to send #delete to the receiver"
	| _gsSqueakTemp_aButton |
	_gsSqueakTemp_aButton := SimpleButtonMorph new.
	_gsSqueakTemp_aButton target: self topRendererOrSelf;
		 color: ColorTheme current cancelColor;
		 borderColor: ColorTheme current cancelColor muchDarker;
		 borderWidth: 1;
		 label: 'X' font: Preferences standardButtonFont;
		 actionSelector: #delete;
		 setBalloonText: 'dismiss' translated.
	^ _gsSqueakTemp_aButton