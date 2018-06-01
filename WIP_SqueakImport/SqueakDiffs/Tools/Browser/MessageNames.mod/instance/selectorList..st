selector list
selectorList: someObjects
	"Answer the selectorList"

	selectorList := someObjects.
	self changed: #selectorList.
	
	"Select first result if any."
	self selectorListIndex: (selectorList size > 0
			ifTrue: [1]
			ifFalse: [0]).