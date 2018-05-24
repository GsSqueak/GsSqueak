accessing
nextVisibleSibling

	| m |
	m := self nextSibling.
	[m isNil or: [m visible]] whileFalse: [
		m := m nextSibling].
	^ m