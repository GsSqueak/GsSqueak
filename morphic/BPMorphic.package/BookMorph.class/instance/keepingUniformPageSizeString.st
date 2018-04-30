uniform page size
keepingUniformPageSizeString
	"Answer a string characterizing whether I am currently maintaining
	uniform page size"
	^ (self maintainsUniformPageSize
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
		, 'keep all pages the same size' translated