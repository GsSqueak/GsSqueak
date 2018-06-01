costume
tearOffButtonToFireScriptForSelector: aSelector 
	"Tear off a button to fire the script for the given selector"
	| _gsSqueakTemp_aButton _gsSqueakTemp_props |
	Preferences useButtonPropertiesToFire
		ifFalse: [_gsSqueakTemp_aButton := ScriptActivationButton new.
			_gsSqueakTemp_aButton
				initializeForPlayer: self
				uniclassScript: (self class scripts at: aSelector).
			^ _gsSqueakTemp_aButton openInHand].
	(_gsSqueakTemp_aButton := RectangleMorph new) useRoundedCorners; color: Color yellow.
	_gsSqueakTemp_props := _gsSqueakTemp_aButton ensuredButtonProperties.
	_gsSqueakTemp_props target: self;
		 actionSelector: #runScript:;
		 arguments: {aSelector};
		 delayBetweenFirings: 80;
		 actWhen: #mouseUp;
		 mouseDownHaloWidth: 8;
		 wantsRolloverIndicator: true;
		 mouseOverHaloWidth: 5;
		 establishEtoyLabelWording.
	_gsSqueakTemp_aButton width: _gsSqueakTemp_aButton submorphs first width + 20;
		 height: 20.
	self currentHand attachMorph: _gsSqueakTemp_aButton