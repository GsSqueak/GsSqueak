-Tools-traits
browseClassRefs
	| _gsSqueakTemp_cls |
	_gsSqueakTemp_cls := self selectedClass.
	(_gsSqueakTemp_cls notNil
			and: [_gsSqueakTemp_cls isTrait not])
		ifTrue: [self systemNavigation browseAllCallsOnClass: _gsSqueakTemp_cls theNonMetaClass]