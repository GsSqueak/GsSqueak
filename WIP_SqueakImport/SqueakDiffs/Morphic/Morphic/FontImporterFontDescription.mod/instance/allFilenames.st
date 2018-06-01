accessing
allFilenames

	^ self filename
		ifNil: [
			(self children
				select: [:child | child filename notNil]
				thenCollect: [:child | child filename])
			asSet asArray]
		ifNotNil: [:f | {f}] 