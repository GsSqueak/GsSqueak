application
buildList
	| list obj parent object key |
	list := OrderedCollection new.
	obj := goal.
	
	[list addFirst: obj.
	obj := parents at: obj ifAbsent: [].
	obj == nil] whileFalse.
	list removeFirst.
	parent := Smalltalk.
	objectList := OrderedCollection new.
	pointerList := OrderedCollection new.
	[list isEmpty]
		whileFalse: 
			[object := list removeFirst.
			key := nil.
			(parent isKindOf: Dictionary)
				ifTrue: [list size >= 2
						ifTrue: 
							[key := parent keyAtValue: list second ifAbsent: [].
							key == nil
								ifFalse: 
									[object := list removeFirst; removeFirst.
									pointerList add: key printString , ' -> ' , object class name]]].
			key == nil
				ifTrue: 
					[parent class == object ifTrue: [key := 'CLASS'].
					key == nil ifTrue: [1 to: parent class instSize do: [:i | key == nil ifTrue: [(parent instVarAt: i)
									== object ifTrue: [key := parent class instVarNameForIndex: i]]]].
					key == nil ifTrue: [parent isCompiledCode ifTrue: [key := 'literals?']].
					key == nil ifTrue: [1 to: parent basicSize do: [:i | key == nil ifTrue: [(parent basicAt: i)
									== object ifTrue: [key := i printString]]]].
					key == nil ifTrue: [(parent isMorph and: [object isKindOf: Array]) ifTrue: [key := 'submorphs?']].
					key == nil ifTrue: [key := '???'].
					pointerList add: key , ': ' , object class name, (object isMorph ifTrue: [' (', object identityHash asString, ')'] ifFalse: [ String empty ]) ].
			objectList add: object.
			parent := object]