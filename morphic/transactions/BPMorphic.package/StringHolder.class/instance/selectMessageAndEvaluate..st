-Tools
selectMessageAndEvaluate: aBlock 
	"Allow the user to choose one selector, chosen from the currently
	selected message's selector, as well as those of all messages sent by
	it, and evaluate aBlock on behalf of chosen selector. If there is only
	one possible choice, simply make it; if there are multiple choices, put
	up a menu, and evaluate aBlock on behalf of the the chosen selector,
	doing nothing if the user declines to choose any"
	| _gsSqueakTemp_selector _gsSqueakTemp_method |
	(_gsSqueakTemp_selector := self selectedMessageName)
		ifNil: [^ self].
	_gsSqueakTemp_method := (self selectedClassOrMetaClass
				ifNil: [^ aBlock value: _gsSqueakTemp_selector])
				compiledMethodAt: _gsSqueakTemp_selector
				ifAbsent: [].
	_gsSqueakTemp_method isNil
		ifTrue: [^ aBlock value: _gsSqueakTemp_selector].
	^ self withSelectorAndMessagesIn: _gsSqueakTemp_method evaluate: aBlock