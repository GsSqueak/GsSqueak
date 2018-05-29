source mapping
sourceText
	self method ifNotNil:
		[:method|
		method holdsTempNames ifTrue:
			[^method
				getSourceFor: (method selector ifNil: [method defaultSelector])
				in: method methodClass]].
	^methodNode sourceText