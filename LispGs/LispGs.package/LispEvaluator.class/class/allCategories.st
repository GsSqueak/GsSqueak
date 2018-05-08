private
allCategories
	^ (Array
		streamContents: [:cstr | self withAllSuperclasses
				do: [:class | cstr nextPutAll: class organization categories]]) asSet