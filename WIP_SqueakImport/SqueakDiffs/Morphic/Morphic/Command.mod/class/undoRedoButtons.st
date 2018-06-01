dog simple ui
undoRedoButtons
	"Answer a morph that offers undo and redo buttons"

	| wrapper |
	"self currentHand attachMorph: Command undoRedoButtons"
	wrapper := AlignmentMorph newColumn.
	wrapper color: Color veryVeryLightGray lighter;
		borderWidth: 0;
		layoutInset: 0;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap.
	#((CrudeUndo undoLastCommand 'undo last command done' undoEnabled CrudeUndoDisabled CrudeUndoDisabled) 
	(CrudeRedo redoNextCommand 'redo last undone command' redoEnabled CrudeRedoDisabled CrudeRedoDisabled)) do:
		[:tuple |
			| aButton |
			wrapper addTransparentSpacerOfSize: (8@0).
			aButton := UpdatingThreePhaseButtonMorph new.
			aButton
				onImage: (ScriptingSystem formAtKey: tuple first);
				offImage: (ScriptingSystem formAtKey: tuple fifth);
				pressedImage: (ScriptingSystem formAtKey: tuple sixth);
				getSelector: tuple fourth;
				color: Color transparent; 
				target: self;
				actionSelector: tuple second;
				setNameTo: tuple second;
				setBalloonText: tuple third;
				extent: aButton onImage extent.
			wrapper addMorphBack: aButton.
			wrapper addTransparentSpacerOfSize: (8@0)].
	^ wrapper