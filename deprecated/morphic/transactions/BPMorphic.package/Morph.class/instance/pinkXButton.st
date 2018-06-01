-Etoys-support
pinkXButton
	"Answer a button with the old X on a pink background, targeted to self"
	| _gsSqueakTemp_aButton |
	_gsSqueakTemp_aButton := IconicButton new
				labelGraphic: (ScriptingSystem formAtKey: #PinkX).
	_gsSqueakTemp_aButton color: Color transparent;
		 borderWidth: 0;
		 shedSelvedge;
		 actWhen: #buttonUp.
	_gsSqueakTemp_aButton target: self.
	^ _gsSqueakTemp_aButton