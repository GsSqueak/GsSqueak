instance creation
fromMethod: oldMethod to: newMethod

	^ self
		from: (oldMethod ifNotNil: [:method | method properties])
		to: (newMethod ifNotNil: [:method | method properties])