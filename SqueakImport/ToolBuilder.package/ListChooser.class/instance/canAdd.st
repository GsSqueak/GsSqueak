testing
canAdd
	^ self addAllowed
		and: [self searchText asString withBlanksTrimmed notEmpty]
		and: [self selectedItem asString ~= self searchText asString]