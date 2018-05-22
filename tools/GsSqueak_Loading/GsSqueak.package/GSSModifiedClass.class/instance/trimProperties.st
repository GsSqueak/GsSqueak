utility
trimProperties

	| propertiesToTrim |
	propertiesToTrim := #(Category ClassInstVars ClassVars CommentStamp InstVars Pools Superclass Type).
	propertiesToTrim do: [:property |
		self trimProperty: property]