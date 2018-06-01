typing support
openTypeInFor: editType
	"Set up UndoSelection to null text (to be added to by readKeyboard and backTo:),
	 beginTypeInBlock to keep track of the leftmost backspace, and UndoParameter to tally
	 how many deleted characters were backspaced over rather than 'cut'.
	 You can't undo typing until after closeTypeIn."

	beginTypeInIndex ifNil: [
		beginTypeInIndex := self startIndex.
		self history beginRemember: (TextEditorCommand new
			type: editType;
			contentsBefore: (self hasSelection ifTrue: [self selection] ifFalse: [self nullText]);
			intervalBefore: (beginTypeInIndex to: self stopIndex-1)
			yourself)].