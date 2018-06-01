model access
getText
	"Retrieve the current model text"
	| _gsSqueakTemp_newText |
	getTextSelector
		ifNil: [^ Text new].
	_gsSqueakTemp_newText := model perform: getTextSelector.
	_gsSqueakTemp_newText
		ifNil: [^ Text new].
	^ _gsSqueakTemp_newText shallowCopy