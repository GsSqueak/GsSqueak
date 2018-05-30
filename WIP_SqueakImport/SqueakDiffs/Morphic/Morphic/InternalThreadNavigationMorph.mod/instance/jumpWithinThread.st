navigation
jumpWithinThread

	| aMenu me weHaveOthers myIndex |

	me := Project current name.
	aMenu := MenuMorph new defaultTarget: self.
	weHaveOthers := false.
	myIndex := self currentIndex.
	listOfPages withIndexDo: [ :each :index |
		index = myIndex ifTrue: [
			aMenu add: 'you are here' translated action: #yourself.
			aMenu lastSubmorph color: Color red.
		] ifFalse: [
			weHaveOthers := true.
			aMenu add: ('jump to <{1}>' translated format:{each first}) selector: #jumpToIndex: argument: index.
			myIndex = (index - 1) ifTrue: [
				aMenu lastSubmorph color: Color blue
			].
			myIndex = (index + 1) ifTrue: [
				aMenu lastSubmorph color: Color orange
			].
		].
	].
	weHaveOthers ifFalse: [^self inform: 'This is the only project in this thread' translated].
	aMenu popUpEvent: self world primaryHand lastEvent in: self world