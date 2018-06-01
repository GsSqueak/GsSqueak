updating
update: aspect

	aspect == #contents
		ifTrue: [
			self changed: #labelString.
			self doSearch: self searchString].
		
	super update: aspect.