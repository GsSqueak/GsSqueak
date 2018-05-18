adjacent splitters
splittersRightDo: aBlock 
	self splitterRight ifNotNil:
		[ : splitter | aBlock value: splitter.
		splitter splittersRightDo: aBlock ]