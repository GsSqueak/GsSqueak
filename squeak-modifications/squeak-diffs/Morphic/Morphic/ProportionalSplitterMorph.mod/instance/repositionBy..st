layout
repositionBy: delta
	| selfTop selfBottom selfLeft selfRight |
	leftOrTop do:
		[ : each | | firstRight firstBottom firstLeft firstTop |
		firstRight := each layoutFrame rightOffset ifNil: [ 0 ].
		firstBottom := each layoutFrame bottomOffset ifNil: [ 0 ].
		each layoutFrame rightOffset: firstRight + delta x.
		each layoutFrame bottomOffset: firstBottom + delta y.
		each layoutFrame hasFixedHeight ifTrue: [
			firstTop := each layoutFrame topOffset ifNil: [ 0 ].
			each layoutFrame topOffset: firstTop + delta y ].
		each layoutFrame hasFixedWidth ifTrue: [
			firstLeft := each layoutFrame leftOffset ifNil: [ 0 ].
			each layoutFrame leftOffset: firstLeft + delta x. ] ].
	rightOrBottom do:
		[ : each | | secondLeft secondTop secondRight secondBottom |
		secondLeft := each layoutFrame leftOffset ifNil: [ 0 ].
		secondTop := each layoutFrame topOffset ifNil: [ 0 ].
		each layoutFrame leftOffset: secondLeft + delta x.
		each layoutFrame topOffset: secondTop + delta y.
		each layoutFrame hasFixedHeight ifTrue: [
			secondBottom := each layoutFrame bottomOffset ifNil: [ 0 ].
			each layoutFrame bottomOffset: secondBottom + delta y. ].
		each layoutFrame hasFixedWidth ifTrue: [
			secondRight := each layoutFrame rightOffset ifNil: [ 0 ].
			each layoutFrame rightOffset: secondRight + delta x. ] ].

	selfTop := self layoutFrame topOffset ifNil: [ 0 ].
	selfBottom := self layoutFrame bottomOffset ifNil: [ 0 ].
	selfLeft := self layoutFrame leftOffset ifNil: [ 0 ].
	selfRight := self layoutFrame rightOffset ifNil: [ 0 ].
	self layoutFrame
		 topOffset: selfTop + delta y ;
		 bottomOffset: selfBottom + delta y ;
		 leftOffset: selfLeft + delta x ;
		 rightOffset: selfRight + delta x.
	self owner layoutChanged.
	self movements removeFirst; add: (splitsTopAndBottom ifTrue: [ delta y sign ] ifFalse: [ delta x sign ])