-Tools-traits
browseVariableAssignments
	| _gsSqueakTemp_cls |
	_gsSqueakTemp_cls := self selectedClassOrMetaClass.
	(_gsSqueakTemp_cls notNil
			and: [_gsSqueakTemp_cls isTrait not])
		ifTrue: [self systemNavigation browseVariableAssignments: _gsSqueakTemp_cls]