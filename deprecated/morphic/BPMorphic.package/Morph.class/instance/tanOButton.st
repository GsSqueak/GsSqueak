-Etoys-support
tanOButton
	"Answer a button with the old O on a tan background, targeted to self"
	| _gsSqueakTemp_aButton |
	_gsSqueakTemp_aButton := IconicButton new
				labelGraphic: (ScriptingSystem formAtKey: #TanO).
	_gsSqueakTemp_aButton color: Color transparent;
		 borderWidth: 0;
		 shedSelvedge;
		 actWhen: #buttonUp.
	_gsSqueakTemp_aButton target: self.
	^ _gsSqueakTemp_aButton