-Tools-traits
browseVariableReferences
	| _gsSqueakTemp_cls |
	_gsSqueakTemp_cls := self selectedClassOrMetaClass.
	(_gsSqueakTemp_cls notNil
			and: [_gsSqueakTemp_cls isTrait not])
		ifTrue: [self systemNavigation browseVariableReferences: _gsSqueakTemp_cls]