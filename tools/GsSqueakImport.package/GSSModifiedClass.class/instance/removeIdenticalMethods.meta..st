utility
removeIdenticalMethods: aCollection meta: aBoolean

	^ (aCollection reject: [:method |
		| originalSource classOrMetaClass |
		classOrMetaClass := aBoolean
							ifTrue: [self realClass theMetaClass]
							ifFalse: [self realClass theNonMetaClass].
		originalSource := classOrMetaClass
								sourceCodeAt: method selector
								ifAbsent: [nil].
		originalSource
			ifNil: [false]
			ifNotNil: [
				method source withBlanksCondensed
				= originalSource asString withBlanksCondensed]]) ifEmpty: [nil]