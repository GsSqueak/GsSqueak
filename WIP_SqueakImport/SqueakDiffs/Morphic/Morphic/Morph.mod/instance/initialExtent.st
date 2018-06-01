user interface
initialExtent
	| ext |
	(ext := self valueOfProperty: #initialExtent)
		ifNotNil:
			[^ ext].
	^ super initialExtent