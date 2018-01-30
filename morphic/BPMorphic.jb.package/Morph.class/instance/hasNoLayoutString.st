layout-menu
hasNoLayoutString
	^ (self layoutPolicy isNil
		ifTrue: ['<on>']
		ifFalse: ['<off>'])
		, 'no layout' translated