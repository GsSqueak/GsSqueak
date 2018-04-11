-Etoys-script-control
goButton
	| _gsSqueakTemp_aButton |
	_gsSqueakTemp_aButton := ThreePhaseButtonMorph new.
	_gsSqueakTemp_aButton
		offImage: (ScriptingSystem formAtKey: 'GoPic');
		
		pressedImage: (ScriptingSystem formAtKey: 'GoPicOn');
		
		image: (ScriptingSystem formAtKey: 'GoPicOn');
		 actionSelector: #goUp:with:;
		
		arguments: (Array with: nil with: _gsSqueakTemp_aButton);
		 actWhen: #buttonUp;
		 target: self;
		 setNameTo: 'Go Button';
		 setBalloonText: 'Resume running all paused scripts' translated.
	^ _gsSqueakTemp_aButton