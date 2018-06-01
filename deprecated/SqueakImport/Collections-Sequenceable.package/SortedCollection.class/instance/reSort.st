private
reSort

	firstIndex < lastIndex ifTrue: [ 
		array quickSortFrom: firstIndex to: lastIndex by: sortBlock ]