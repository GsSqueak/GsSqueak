explain
explainClass: symbol 
	"Is symbol a class variable or a pool variable?"
	| class reply classes |
	(model respondsTo: #selectedClassOrMetaClass)
		ifFalse: [^ nil].
	(class := model selectedClassOrMetaClass) ifNil: [^ nil].
	"no class is selected"
	(class isKindOf: Metaclass)
		ifTrue: [class := class soleInstance].
	classes := class withAllSuperclasses.
	"class variables"
	reply := classes detect: [:each | each classVarNames anySatisfy: [:name | symbol = name]]
				ifNone: [].
	reply == nil ifFalse: [^ '"is a class variable, defined in class ' , reply printString , '"\' withCRs , 'SystemNavigation new browseAllCallsOn: (' , reply printString , ' classPool associationAt: #' , symbol , ').'].
	"pool variables"
	classes do: [:each | each sharedPools
			anySatisfy: [:pool | (pool includesKey: symbol)
					and: 
						[reply := pool.
						true]]].
	reply
		ifNil: [(class environment isUndeclared: symbol)
				ifTrue: [^ '"is an undeclared variable.' , '"\' withCRs , 'SystemNavigation new browseAllCallsOn: (Undeclared associationAt: #' , symbol , ').']]
		ifNotNil: 
			[classes := WriteStream on: Array new.
			self systemNavigation
				allBehaviorsDo: [:each | (each sharedPools
						detect: 
							[:pool | 
							pool == reply]
						ifNone: [])
						~~ nil ifTrue: [classes nextPut: each]].
			"Perhaps not print whole list of classes if too long. (unlikely)"
			^ '"is a pool variable from the pool ' , (Smalltalk globals keyAtIdentityValue: reply) asString , ', which is used by the following classes ' , classes contents printString , '"\' withCRs , 'SystemNavigation new browseAllCallsOn: (' , (Smalltalk globals keyAtIdentityValue: reply) asString , ' bindingOf: #' , symbol , ').'].
	^ nil