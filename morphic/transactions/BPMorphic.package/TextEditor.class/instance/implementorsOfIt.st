menu messages
implementorsOfIt
	"Open an implementors browser on the selected selector"
	| _gsSqueakTemp_aSelector |
	self
		lineSelectAndEmptyCheck: [^ self].
	(_gsSqueakTemp_aSelector := self selectedSelector) == nil
		ifTrue: [^ morph flash].
	model browseAllImplementorsOf: _gsSqueakTemp_aSelector