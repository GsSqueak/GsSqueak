insert and delete
insertPage: aPage pageSize: aPageSize atIndex: anIndex 
	| sz predecessor |
	sz := aPageSize 
				ifNil: [currentPage isNil ifTrue: [pageSize] ifFalse: [currentPage extent]]
				ifNotNil: [aPageSize].
	aPage extent: sz.
	(pages isEmpty | anIndex isNil or: [anIndex > pages size]) 
		ifTrue: [pages add: aPage]
		ifFalse: 
			[anIndex <= 1 
				ifTrue: [pages addFirst: aPage]
				ifFalse: 
					[predecessor := anIndex isNil 
								ifTrue: [currentPage]
								ifFalse: [pages at: anIndex].
					self pages add: aPage after: predecessor]].
	self goToPageMorph: aPage