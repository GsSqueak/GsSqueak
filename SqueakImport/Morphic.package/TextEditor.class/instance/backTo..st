typing support
backTo: startIndex
	"During typing, backspace to startIndex. If there already is a selection, just delete that selection. Otherwise, check if we did something else than backward-deletion and start a new command if so."

	morph readOnly ifTrue: [^ self].

	self hasSelection ifTrue: [
		"Add checkpoint in undo history."
		self replaceSelectionWith: self nullText.
		^ true].

	startIndex > self text size ifTrue: [^ false].

	self selectInvisiblyFrom: startIndex to: self stopIndex-1.
	
	self isTypingIn ifTrue: [
		self history current type = #backward
			ifFalse: [self closeTypeIn]
			ifTrue: [
				"Accumulate all deleted characters in current undo command."
				self history current contentsBefore replaceFrom: 1 to: 0 with: self selection.
				self history current intervalBefore in: [:i |
					self history current intervalBefore: (startIndex to: i last)]]].
		
	self openTypeInFor: #backward.
	self zapSelectionWith: self nullText.
	
	^ false