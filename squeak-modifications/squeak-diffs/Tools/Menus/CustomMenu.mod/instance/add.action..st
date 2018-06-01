construction
add: aString action: actionItem
	"Add the given string as the next menu item. If it is selected, the given action (usually but not necessarily a symbol) will be returned to the client."

	| s |
	aString ifNil: [^ self addLine].
	s := String new: aString size + 2.
	s at: 1 put: Character space.
	s replaceFrom: 2 to: s size - 1 with: aString.
	s at: s size put: Character space.
	labels addLast: s.
	selections addLast: actionItem.