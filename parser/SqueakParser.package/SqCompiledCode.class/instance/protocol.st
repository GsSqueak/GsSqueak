accessing
protocol
	^ self methodClass
		ifNotNil: [:t2 | self selector
				ifNotNil: [:t1 | t2 whichCategoryIncludesSelector: t1]]