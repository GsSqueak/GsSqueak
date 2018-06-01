insert and delete
insertPage: aPage pageSize: aPageSize
	^ self insertPage: aPage pageSize: aPageSize atIndex: (pages size + 1)