query
obsoleteMethodReferences
	"SystemNavigation default obsoleteMethodReferences"

	"Open a browser on all referenced behaviors that are obsolete"

	| obsClasses references |
	references := WriteStream on: Array new.
	obsClasses := self obsoleteBehaviors.
	'Scanning for methods referencing obsolete classes' 
		displayProgressFrom: 1
		to: obsClasses size
		during: 
			[:bar | 
			obsClasses keysAndValuesDo: 
					[:index :each | | obsRefs | 
					bar value: index.
					obsRefs := Utilities pointersTo: each except: obsClasses.
					obsRefs do: 
							[:ref | 
							"Figure out if it may be a global"

							(ref isVariableBinding and: [ref key isString	"or Symbol"]) 
								ifTrue: 
									[(Utilities pointersTo: ref) do: 
											[:meth | 
											(meth isKindOf: CompiledMethod) 
												ifTrue: [meth methodReference ifNotNil: [:mref | references nextPut: mref]]]]]]].
	^references contents