event handling
mouseDown: evt

	| selectedItem |
	self items isEmpty ifTrue: [^ self].
	selectedItem := UIManager default chooseFrom: self items values: self items.
	selectedItem ifNil: [^ self].
	self contentsClipped: selectedItem.  "Client can override this if necess"
	actionSelector ifNotNil: [
		target
			perform: actionSelector
			withArguments: (arguments copyWith: selectedItem)].
