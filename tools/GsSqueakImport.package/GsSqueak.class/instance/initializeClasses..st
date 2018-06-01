installing
initializeClasses: arrayOfClasses

	| classesToInitialize |
	classesToInitialize := self classesToInitializeFirst collect: [:className |
							arrayOfClasses
								detect: [:class | class name = className asSymbol]
								ifNone: [nil]].
	classesToInitialize := classesToInitialize reject: [:class | class isNil].
	classesToInitialize := classesToInitialize , (arrayOfClasses reject: [:class | classesToInitialize includes: class]).
	classesToInitialize := classesToInitialize reject: [:class | self classesNotToInitialize includes: class name asString].
	'Initializing classes'
		displayProgressFrom: 0
		to: classesToInitialize size
		during: [:initializeBar |
			UIManager default informUserDuring: [:info |
				classesToInitialize withIndexDo: [:class :initializeIndex |
					info value: class name.
					class initializeClass.
					initializeBar value: initializeIndex.
					class environment repository commitTransaction.]]]