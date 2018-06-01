private
currentIndex

	| currentName |

	currentName := Project current name.
	listOfPages withIndexDo: [ :each :index |
		(each first = currentName and: [preferredIndex = index]) ifTrue: [^currentIndex := index]
	].
	listOfPages withIndexDo: [ :each :index |
		each first = currentName ifTrue: [^currentIndex := index]
	].
	
	currentIndex isNil
		ifTrue: [^ 1].

	^ currentIndex min: listOfPages size
