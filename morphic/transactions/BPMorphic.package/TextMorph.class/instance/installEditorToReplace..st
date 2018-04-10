private
installEditorToReplace: priorEditor 
	"Install an editor for my paragraph. This constitutes 'hasFocus'.
	If priorEditor is not nil, then initialize the new editor from its state.
	We may want to rework this so it actually uses the prior editor."
	| _gsSqueakTemp_stateArray |
	priorEditor
		ifNotNil: [_gsSqueakTemp_stateArray := priorEditor stateArray].
	editor := self editorClass new morph: self.
	editor changeParagraph: self paragraph.
	priorEditor
		ifNil: [editor history: TextEditorCommandHistory new]
		ifNotNil: [editor stateArrayPut: _gsSqueakTemp_stateArray].
	self selectionChanged.
	^ editor