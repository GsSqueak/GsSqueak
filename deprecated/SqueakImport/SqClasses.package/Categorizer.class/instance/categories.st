accessing
categories
	"Answer an Array of categories (names)."
	categoryArray isNil ifTrue: [^ nil].
	self isEmpty ifTrue: [^Array with: NullCategory].
	^categoryArray