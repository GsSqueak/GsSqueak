page controls
makePageControlsFrom: controlSpecs 
	"From the controlSpecs, create a set of page control and return them
	-- this method does *not* add the controls to the receiver."
	| _gsSqueakTemp_c _gsSqueakTemp_col _gsSqueakTemp_row |
	_gsSqueakTemp_c := color saturation > 0.1
				ifTrue: [color slightlyLighter]
				ifFalse: [color slightlyDarker].
	_gsSqueakTemp_col := AlignmentMorph newColumn.
	_gsSqueakTemp_col color: _gsSqueakTemp_c;
		 borderWidth: 0;
		 layoutInset: 0.
	_gsSqueakTemp_col hResizing: #spaceFill;
		 vResizing: #shrinkWrap;
		 extent: 5 @ 5.
	_gsSqueakTemp_row := AlignmentMorph newRow.
	_gsSqueakTemp_row color: _gsSqueakTemp_c;
		 borderWidth: 0;
		 layoutInset: 0.
	_gsSqueakTemp_row hResizing: #spaceFill;
		 vResizing: #shrinkWrap;
		 extent: 5 @ 5.
	controlSpecs
		do: [:spec | 
			| lastGuy b |
			spec == #showDescription
				ifTrue: [_gsSqueakTemp_row addMorphBack: self makeDescriptionViewer].
			spec == #pageNumber
				ifTrue: [_gsSqueakTemp_row addMorphBack: self makePageNumberItem].
			spec == #spacer
				ifTrue: [_gsSqueakTemp_row addTransparentSpacerOfSize: 10 @ 0].
			spec == #variableSpacer
				ifTrue: [_gsSqueakTemp_row addMorphBack: AlignmentMorph newVariableTransparentSpacer].
			spec class == Array
				ifTrue: [spec first isSymbol
						ifTrue: [b := ThreePhaseButtonMorph labelSymbol: spec first]
						ifFalse: [b := SimpleButtonMorph new borderWidth: 2;
										 borderColor: Color black;
										 color: Color veryLightGray.
							b label: spec first font: Preferences standardMenuFont].
					b target: self;
						 actionSelector: spec second;
						 setBalloonText: spec third.
					(spec atPin: 4)
							= #border
						ifTrue: [b actWhen: #buttonDown]
						ifFalse: [b borderWidth: 0].
					"default is none"
					_gsSqueakTemp_row addMorphBack: b.
					(((lastGuy := spec last asLowercase) includesSubstring: 'menu')
							or: [lastGuy includesSubstring: 'designations'])
						ifTrue: [b actWhen: #buttonDown]]].
	"pop up menu on mouseDown"
	_gsSqueakTemp_col addMorphBack: _gsSqueakTemp_row.
	^ _gsSqueakTemp_col