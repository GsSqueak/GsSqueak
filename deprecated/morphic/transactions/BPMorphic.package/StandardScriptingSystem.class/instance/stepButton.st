-Etoys-script-control
stepButton
	| _gsSqueakTemp_aButton |
	self flag: #deferred.
	"ambiguity about recipients"
	_gsSqueakTemp_aButton := ThreePhaseButtonMorph new.
	_gsSqueakTemp_aButton
		offImage: (ScriptingSystem formAtKey: 'StepPic');
		
		pressedImage: (ScriptingSystem formAtKey: 'StepPicOn');
		
		image: (ScriptingSystem formAtKey: 'StepPicOn');
		
		arguments: (Array with: nil with: _gsSqueakTemp_aButton);
		 actionSelector: #stepStillDown:with:;
		 target: self;
		 setNameTo: 'Step Button';
		 actWhen: #whilePressed;
		
		on: #mouseDown
		send: #stepDown:with:
		to: self;
		
		on: #mouseStillDown
		send: #stepStillDown:with:
		to: self;
		
		on: #mouseUp
		send: #stepUp:with:
		to: self;
		 setBalloonText: 'Run every paused script exactly once.  Keep the mouse button down over "Step" and everything will keep running until you release it' translated.
	^ _gsSqueakTemp_aButton