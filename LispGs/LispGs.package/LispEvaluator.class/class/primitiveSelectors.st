private
primitiveSelectors
	^ Array
		streamContents: [:str | (self allCategories
				select: [:cat | cat includesSubString: 'LISP-primitives'])
				do: [:cat | str nextPutAll: (self selectorsIn: cat)]]
