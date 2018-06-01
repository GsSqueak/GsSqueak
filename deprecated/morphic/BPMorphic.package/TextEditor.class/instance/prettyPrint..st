menu messages
prettyPrint: decorated 
	"Reformat the contents of the receiver's view (a Browser)."
	| _gsSqueakTemp_selectedClass _gsSqueakTemp_newText |
	_gsSqueakTemp_selectedClass := model selectedClassOrMetaClass.
	_gsSqueakTemp_selectedClass
		ifNil: [^ morph flash].
	_gsSqueakTemp_newText := _gsSqueakTemp_selectedClass newCompiler
				format: self text
				in: _gsSqueakTemp_selectedClass
				notifying: self
				decorated: decorated.
	_gsSqueakTemp_newText
		ifNotNil: [self deselect; selectInvisiblyFrom: 1 to: paragraph text size.
			self
				replaceSelectionWith: (_gsSqueakTemp_newText asText makeSelectorBoldIn: _gsSqueakTemp_selectedClass).
			self selectAt: self text size + 1]