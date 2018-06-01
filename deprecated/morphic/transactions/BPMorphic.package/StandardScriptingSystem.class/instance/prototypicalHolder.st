-Etoys-parts bin
prototypicalHolder
	| _gsSqueakTemp_aHolder |
	_gsSqueakTemp_aHolder := PasteUpMorph authoringPrototype color: Color orange muchLighter;
				 borderColor: Color orange lighter.
	_gsSqueakTemp_aHolder setNameTo: 'holder';
		 extent: 160 @ 110.
	^ _gsSqueakTemp_aHolder behaveLikeHolder