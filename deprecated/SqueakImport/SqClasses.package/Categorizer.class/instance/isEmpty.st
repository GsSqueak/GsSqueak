testing
isEmpty

	^ (categoryArray size = 1 
		and: [categoryArray first = Default & (elementArray size = 0)])