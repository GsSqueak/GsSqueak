-Tools
messageListKey: aChar from: view 
	"Respond to a Command key. I am a model with a code pane, and I
	also have a listView that has a list of methods. The view knows how to
	get the list and selection."
	| _gsSqueakTemp_sel _gsSqueakTemp_class |
	aChar == $D
		ifTrue: [^ self toggleDiffing].
	_gsSqueakTemp_sel := self selectedMessageName.
	aChar == $m
		ifTrue: ["These next two put up a type in if no message selected"
			^ self
				useSelector: _gsSqueakTemp_sel
				orGetSelectorAndSendQuery: #browseAllImplementorsOf:
				to: self systemNavigation].
	aChar == $n
		ifTrue: [^ self
				useSelector: _gsSqueakTemp_sel
				orGetSelectorAndSendQuery: #browseAllCallsOn:
				to: self systemNavigation].
	"The following require a class selection"
	(_gsSqueakTemp_class := self selectedClassOrMetaClass)
		ifNil: [^ self arrowKey: aChar from: view].
	aChar == $b
		ifTrue: [^ ToolSet browse: _gsSqueakTemp_class selector: _gsSqueakTemp_sel].
	aChar == $N
		ifTrue: [^ self browseClassRefs].
	aChar == $i
		ifTrue: [^ self methodHierarchy].
	aChar == $h
		ifTrue: [^ self classHierarchy].
	aChar == $p
		ifTrue: [^ self browseFullProtocol].
	"The following require a method selection"
	_gsSqueakTemp_sel
		ifNotNil: [aChar == $o
				ifTrue: [^ self fileOutMessage].
			aChar == $c
				ifTrue: [^ self copySelector].
			aChar == $C
				ifTrue: [^ self copyReference].
			aChar == $v
				ifTrue: [^ self browseVersions].
			aChar == $x
				ifTrue: [^ self removeMessage]].
	^ self arrowKey: aChar from: view