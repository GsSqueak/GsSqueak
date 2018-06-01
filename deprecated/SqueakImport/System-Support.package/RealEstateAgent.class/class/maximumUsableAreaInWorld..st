accessing
maximumUsableAreaInWorld: aWorldOrNil

	| allowedArea |
	allowedArea := Display usableArea.
	aWorldOrNil ifNotNil: [
		allowedArea := allowedArea intersect: aWorldOrNil visibleClearArea.
		Smalltalk isMorphic ifTrue: [
			(((Smalltalk classNamed: 'Flaps') ifNil: [false] ifNotNil: [:cls | cls anyFlapsVisibleIn: aWorldOrNil])
				and: [self respondsTo: #reduceByFlaps:])
					ifTrue: [allowedArea := self reduceByFlaps: allowedArea]]].
	^allowedArea