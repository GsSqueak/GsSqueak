explain
explainClass: symbol 
	"Is symbol a class variable or a pool variable?"
	| _gsSqueakTemp_class _gsSqueakTemp_reply _gsSqueakTemp_classes |
	(model respondsTo: #selectedClassOrMetaClass)
		ifFalse: [^ nil].
	(_gsSqueakTemp_class := model selectedClassOrMetaClass)
		ifNil: [^ nil].
	"no class is selected"
	(_gsSqueakTemp_class isKindOf: Metaclass)
		ifTrue: [_gsSqueakTemp_class := _gsSqueakTemp_class soleInstance].
	_gsSqueakTemp_classes := _gsSqueakTemp_class withAllSuperclasses.
	"class variables"
	_gsSqueakTemp_reply := _gsSqueakTemp_classes
				detect: [:each | each classVarNames
						anySatisfy: [:name | symbol = name]]
				ifNone: [].
	_gsSqueakTemp_reply == nil
		ifFalse: [^ '"is a class variable, defined in class ' , _gsSqueakTemp_reply printString , '"\' withCRs , 'SystemNavigation new browseAllCallsOn: (' , _gsSqueakTemp_reply printString , ' classPool associationAt: #' , symbol , ').'].
	"pool variables"
	_gsSqueakTemp_classes
		do: [:each | each sharedPools
				anySatisfy: [:pool | (pool includesKey: symbol)
						and: [_gsSqueakTemp_reply := pool.
							true]]].
	_gsSqueakTemp_reply
		ifNil: [(_gsSqueakTemp_class environment isUndeclared: symbol)
				ifTrue: [^ '"is an undeclared variable.' , '"\' withCRs , 'SystemNavigation new browseAllCallsOn: (Undeclared associationAt: #' , symbol , ').']]
		ifNotNil: [_gsSqueakTemp_classes := WriteStream on: Array new.
			self systemNavigation
				allBehaviorsDo: [:each | (each sharedPools
							detect: [:pool | pool == _gsSqueakTemp_reply]
							ifNone: [])
							~~ nil
						ifTrue: [_gsSqueakTemp_classes nextPut: each]].
			"Perhaps not print whole list of classes if too long. (unlikely)"
			^ '"is a pool variable from the pool ' , (Smalltalk globals keyAtIdentityValue: _gsSqueakTemp_reply) asString , ', which is used by the following classes ' , _gsSqueakTemp_classes contents printString , '"\' withCRs , 'SystemNavigation new browseAllCallsOn: (' , (Smalltalk globals keyAtIdentityValue: _gsSqueakTemp_reply) asString , ' bindingOf: #' , symbol , ').'].
	^ nil