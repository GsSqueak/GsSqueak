drawing-general
fullDraw: aMorph 
	(morphLevel = 0 and: [aMorph pagesHandledAutomatically not]) 
		ifTrue: 
			[pages := pages + 1.
			target
				print: '%%Page: 1 1';
				cr].
	super fullDraw: aMorph.
	morphLevel = 0 
		ifTrue: 
			[ self writeTrailer: pages. ]