dummy
preserveStateDuring: aBlock

	^ canvas preserveStateDuring:
		"Note block arg must be self so various things get overridden properly"
		[:inner | aBlock value: self]

