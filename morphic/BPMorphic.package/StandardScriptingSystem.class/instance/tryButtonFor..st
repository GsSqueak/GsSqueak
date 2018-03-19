-Etoys-utilities
tryButtonFor: aPhraseTileMorph 
	| _gsSqueakTemp_aButton |
	_gsSqueakTemp_aButton := SimpleButtonMorph new.
	_gsSqueakTemp_aButton target: aPhraseTileMorph;
		 actionSelector: #try;
		 label: '!' font: Preferences standardEToysFont;
		 color: Color yellow;
		 borderWidth: 0.
	_gsSqueakTemp_aButton actWhen: #whilePressed.
	_gsSqueakTemp_aButton balloonTextSelector: #try.
	^ _gsSqueakTemp_aButton