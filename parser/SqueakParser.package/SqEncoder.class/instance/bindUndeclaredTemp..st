private
bindUndeclaredTemp: name 
	^ scopeTable
		at: name
		put: (self newUndeclaredTemp: name)