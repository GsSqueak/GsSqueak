tests
test01ColorAt

	| text |
	text := Text fromString: 'Hello'.
	self assert: Color black equals: (text colorAt: 1).
	self should: [text colorAt: 1 ifNone: [Error signal]] raise: Error.

	text := Text string: 'Hello' attribute: (TextColor color: Color gray).
	self assert: Color gray equals: (text colorAt: 1).
	