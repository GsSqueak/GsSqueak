path and pattern
suffixList: listOfStrings
	"Make a pattern list from a one or more filename suffix strings in a list , i.e. #('jpg' 'mpeg') "

	listOfStrings isEmptyOrNil
		ifTrue: [patternList := self defaultPatternList]
		ifFalse: [patternList := OrderedCollection new.
				listOfStrings do: [:each|
					each isEmptyOrNil ifFalse:[ patternList add: '*.',each] ] ]