menu
addTitle

	| string |
	string := UIManager default request: 'Title for this menu?'.
	string isEmpty ifTrue: [^ self].
	self addTitle: string.
