diffing
collectClassesIn: anEnvironment

	| dict classesToCollect |
	dict := Dictionary new.
	classesToCollect := self classesToCollectIn: anEnvironment.
	'Collecting classes in ' , anEnvironment asString
		displayProgressFrom: 0
		to: classesToCollect
		during: [:progress |
			classesToCollect withIndexDo: [:className :index |
				| class |
				class := anEnvironment classNamed: className.
				dict at: class name put: class.
				progress value: index]].
	^ dict