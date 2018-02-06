other
name
	"Return this color's name, or nil if it has no name. Only returns a name
	if it exactly matches the named color."
	^ ColorNames
		detect: [:name | (Color perform: name)
				= self]
		ifNone: []