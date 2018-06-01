scripts-execution
runAllOpeningScripts
	"Run all the receiver's scripts marked as #opening. Return a boolean
	indicating whether any such scripts were encountered and run"
	| _gsSqueakTemp_any |
	_gsSqueakTemp_any := false.
	self
		instantiatedUserScriptsDo: [:aScriptInstantiation | aScriptInstantiation runIfOpening
				ifTrue: [_gsSqueakTemp_any := true]].
	^ _gsSqueakTemp_any