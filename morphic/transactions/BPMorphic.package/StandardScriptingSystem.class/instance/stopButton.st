-Etoys-script-control
stopButton
	"Answer a new button that can serve as a stop button"
	| _gsSqueakTemp_aButton |
	_gsSqueakTemp_aButton := ThreePhaseButtonMorph new.
	_gsSqueakTemp_aButton
		offImage: (ScriptingSystem formAtKey: 'StopPic');
		
		pressedImage: (ScriptingSystem formAtKey: 'StopPicOn');
		
		image: (ScriptingSystem formAtKey: 'StopPic').
	_gsSqueakTemp_aButton actionSelector: #stopUp:with:;
		
		arguments: (Array with: nil with: _gsSqueakTemp_aButton);
		 actWhen: #buttonUp;
		 target: self;
		 setNameTo: 'Stop Button';
		 setBalloonText: 'Pause all ticking scripts.' translated.
	^ _gsSqueakTemp_aButton