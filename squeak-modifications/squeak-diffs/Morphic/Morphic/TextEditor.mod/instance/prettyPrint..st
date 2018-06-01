menu messages
prettyPrint: decorated 
	"Reformat the contents of the receiver's view (a Browser or Workspace)."

	model selectedClassOrMetaClass
		ifNil: [ "arbitrary text selection in a workspace, not directly associated with a class"
			(Compiler new formatNoPattern: self selection environment: model environment)
				ifNotNilDo: [:newText | self replaceSelectionWith: newText]]
		ifNotNil: [:selectedClass | "source for a method in the selected class"
			(selectedClass newCompiler
					format: self text
					in: selectedClass
					notifying: self
					decorated: decorated)
				ifNotNilDo: [ :newText |
						self deselect; selectInvisiblyFrom: 1 to: paragraph text size.
						self replaceSelectionWith: (selectedClass ifNil: [newText] ifNotNil: [newText asText makeSelectorBoldIn: selectedClass]).
						self selectAt: self text size + 1 ]].
