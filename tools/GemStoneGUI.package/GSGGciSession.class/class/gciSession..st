instance creation
gciSession: gciSession

	| newInstance |
	newInstance := self new
						gciSession: gciSession;
						yourself.
	self addInstance: newInstance.
	^ newInstance