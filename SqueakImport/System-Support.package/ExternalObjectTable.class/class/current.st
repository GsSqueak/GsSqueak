accessing
current

	^current ifNil: [
		| newInstance |
		newInstance := self new.
		" Check again, because another process might have registered another instance. "
		current ifNil: [ current := newInstance ] ]