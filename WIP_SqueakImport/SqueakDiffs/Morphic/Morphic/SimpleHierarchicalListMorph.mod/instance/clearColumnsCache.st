private - caching
clearColumnsCache

	columnsCache := self columns
		ifNil: [Array empty]
		ifNotNil: [:c | Array new: c size].