private
initialize: n

	super initialize: n.
	order := self class arrayType new: n + 1 * 3 // 4