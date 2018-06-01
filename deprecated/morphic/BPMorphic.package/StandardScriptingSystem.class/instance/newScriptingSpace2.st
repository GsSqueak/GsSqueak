-Etoys-utilities
newScriptingSpace2
	"Answer a complete scripting space"
	| _gsSqueakTemp_aTemplate _gsSqueakTemp_aPlayfield _gsSqueakTemp_aControl |
	(_gsSqueakTemp_aTemplate := PasteUpMorph new) setNameTo: 'etoy';
		 extent: 638 @ 470;
		 color: Color white;
		 impartPrivatePresenter;
		 setProperty: #automaticPhraseExpansion toValue: true;
		 beSticky.
	_gsSqueakTemp_aTemplate useRoundedCorners; borderWidth: 2.
	_gsSqueakTemp_aControl := ScriptingSystem scriptControlButtons setToAdhereToEdge: #bottomLeft.
	_gsSqueakTemp_aControl beSticky; borderWidth: 0; beTransparent.
	_gsSqueakTemp_aTemplate addMorphBack: _gsSqueakTemp_aControl.
	_gsSqueakTemp_aTemplate presenter addTrashCan.
	_gsSqueakTemp_aTemplate addMorph: (_gsSqueakTemp_aPlayfield := PasteUpMorph new).
	_gsSqueakTemp_aPlayfield setNameTo: 'playfield';
		 useRoundedCorners;
		 setToAdhereToEdge: #topLeft;
		 extent: 340 @ 300;
		 position: _gsSqueakTemp_aTemplate topRight - (400 @ 0);
		 beSticky;
		 automaticViewing: true;
		 wantsMouseOverHalos: true.
	_gsSqueakTemp_aTemplate presenter standardPlayfield: _gsSqueakTemp_aPlayfield.
	^ _gsSqueakTemp_aTemplate