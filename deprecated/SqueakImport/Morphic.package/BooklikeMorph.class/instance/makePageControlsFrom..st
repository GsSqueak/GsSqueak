page controls
makePageControlsFrom: controlSpecs
	"From the controlSpecs, create a set of page control and return them -- this method does *not* add the controls to the receiver."

	| c col row |
	c := (color saturation > 0.1) ifTrue: [color slightlyLighter] ifFalse: [color slightlyDarker].
	col := AlignmentMorph newColumn.
	col color: c; borderWidth: 0; layoutInset: 0.
	col hResizing: #spaceFill; vResizing: #shrinkWrap; extent: 5@5.

	row := AlignmentMorph newRow.
	row color: c; borderWidth: 0; layoutInset: 0.
	row hResizing: #spaceFill; vResizing: #shrinkWrap; extent: 5@5.
	controlSpecs do: [:spec | | lastGuy b |
		spec == #showDescription ifTrue: [row addMorphBack: self makeDescriptionViewer].
		spec == #pageNumber ifTrue: [row addMorphBack: self makePageNumberItem].
		spec == #spacer ifTrue: [row addTransparentSpacerOfSize: (10 @ 0)].
		spec == #variableSpacer ifTrue: [
			row addMorphBack: AlignmentMorph newVariableTransparentSpacer].
		spec class == Array ifTrue: [
			spec first isSymbol
				ifTrue: [b := ThreePhaseButtonMorph labelSymbol: spec first]
				ifFalse: [b := SimpleButtonMorph new borderWidth: 2; 
							borderColor: Color black; color: Color veryLightGray.
							b label: spec first font: Preferences standardMenuFont].
				b target: self;  actionSelector: spec second;  setBalloonText: spec third.
				(spec atPin: 4) = #border 
					ifTrue: [b actWhen: #buttonDown]
					ifFalse: [b borderWidth: 0].	"default is none"
				row addMorphBack: b.
				(((lastGuy := spec last asLowercase) includesSubstring: 'menu') or:
						[lastGuy includesSubstring: 'designations'])
					ifTrue: [b actWhen: #buttonDown]]].  "pop up menu on mouseDown"
		col addMorphBack: row.
	^ col