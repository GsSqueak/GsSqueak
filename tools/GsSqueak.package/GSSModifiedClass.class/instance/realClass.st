accessing
realClass

	^ realClass ifNil: [(realClass := self environment classNamed: self name) ifNil: [self error: 'Could not find class to modify']]