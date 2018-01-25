objects from disk
withClassVersion: aVersion 	aVersion <= self classVersion		ifTrue: [^ self].	^ super withClassVersion: aVersion