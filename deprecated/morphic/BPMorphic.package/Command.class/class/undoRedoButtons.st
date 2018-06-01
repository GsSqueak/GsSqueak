dog simple ui
undoRedoButtons
	"Answer a morph that offers undo and redo buttons"
	"self currentHand attachMorph: Command undoRedoButtons"
	| _gsSqueakTemp_wrapper |
	_gsSqueakTemp_wrapper := AlignmentMorph newColumn.
	_gsSqueakTemp_wrapper color: Color veryVeryLightGray lighter;
		 borderWidth: 0;
		 layoutInset: 0;
		 vResizing: #shrinkWrap;
		 hResizing: #shrinkWrap.
	#(#(#CrudeUndo #undoLastCommand 'undo last command done' #undoEnabled #CrudeUndoDisabled #CrudeUndoDisabled ) #(#CrudeRedo #redoNextCommand 'redo last undone command' #redoEnabled #CrudeRedoDisabled #CrudeRedoDisabled ) )
		do: [:tuple | 
			| aButton |
			_gsSqueakTemp_wrapper addTransparentSpacerOfSize: 8 @ 0.
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
			_gsSqueakTemp_wrapper addMorphBack: aButton.
			_gsSqueakTemp_wrapper addTransparentSpacerOfSize: 8 @ 0].
	^ _gsSqueakTemp_wrapper