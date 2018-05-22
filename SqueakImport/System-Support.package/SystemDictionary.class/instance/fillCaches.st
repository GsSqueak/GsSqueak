classes and traits
fillCaches
	"Fill cachedClassNames and cachedNonClassNames. Return an array with the calculated values."

	| classNames nonClassNames |
	classNames := OrderedCollection new: self size.
	nonClassNames := OrderedCollection new.
	self keysAndValuesDo: [ :key :value |
		value isInMemory ifTrue: [
			"The key == value name test below addresses two separate issues:
				1) Obsolete classes, where key = #Foo and value name = 'AnObsoleteFoo'
				2) Aliases, i.e., Smalltalk at: #OtherName put: aClass"
			((value isKindOf: Class) and: [ key == value name ])
				ifTrue: [ classNames add: key ]
				ifFalse: [ nonClassNames add: key ] ] ].
	classNames sort.
	cachedNonClassNames := nonClassNames sort.
	cachedClassNames := classNames.
	^{ classNames. nonClassNames }