explain
explainInst: string 
	"Is string an instance variable of this class?"
	| _gsSqueakTemp_classes _gsSqueakTemp_cls |
	(model respondsTo: #selectedClassOrMetaClass)
		ifTrue: [_gsSqueakTemp_cls := model selectedClassOrMetaClass].
	_gsSqueakTemp_cls
		ifNil: [^ nil].
	"no class known"
	_gsSqueakTemp_classes := (Array with: _gsSqueakTemp_cls)
				, _gsSqueakTemp_cls allSuperclasses.
	_gsSqueakTemp_classes := _gsSqueakTemp_classes
				detect: [:each | each instVarNames
						anySatisfy: [:name | name = string]]
				ifNone: [^ nil].
	_gsSqueakTemp_classes := _gsSqueakTemp_classes printString.
	^ '"is an instance variable of the receiver; defined in class ' , _gsSqueakTemp_classes , '"\' withCRs , _gsSqueakTemp_classes , ' systemNavigation browseAllAccessesTo: ''' , string , ''' from: ' , _gsSqueakTemp_classes , '.'