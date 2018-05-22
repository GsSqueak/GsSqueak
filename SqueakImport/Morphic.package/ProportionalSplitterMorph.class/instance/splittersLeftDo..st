adjacent splitters
splittersLeftDo: aBlock 
	self splitterLeft ifNotNil:
		[ : splitter | aBlock value: splitter.
		splitter splittersLeftDo: aBlock ]