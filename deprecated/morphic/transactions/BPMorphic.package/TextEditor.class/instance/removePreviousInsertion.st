typing support
removePreviousInsertion
	"If the previous command was an insertion, remove it by not undoing
	it but replacing it with nothing."
	self history hasInsertedSomething
		ifFalse: [morph flash.
			^ false].
	self selectInvisiblyFrom: self history previous intervalBefore first to: self history previous intervalAfter last.
	self replaceSelectionWith: self nullText.
	^ true