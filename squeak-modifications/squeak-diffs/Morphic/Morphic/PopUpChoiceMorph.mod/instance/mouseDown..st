event handling
mouseDown: evt 
	| items selectedItem |
	(target isNil or: [getItemsSelector isNil]) ifTrue: [^self].
	items := ((target perform: getItemsSelector withArguments: getItemsArgs)
				ifNil: [#()]) asOrderedCollection.
	selectedItem := UIManager default 
		chooseFrom: items
		values: items.
	selectedItem ifNil: [^self].
	self contentsClipped: selectedItem.	"Client can override this if necess"
	actionSelector ifNotNil: 
			[target perform: actionSelector
				withArguments: (arguments copyWith: selectedItem)]