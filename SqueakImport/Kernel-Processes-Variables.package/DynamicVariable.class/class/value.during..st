accessing
value: anObject during: aBlock

	| p oldValue outerScopeWasDynamic |
	p := Processor activeProcess.
	outerScopeWasDynamic := true.
	oldValue := p
		environmentAt: self
		ifAbsent: [outerScopeWasDynamic := false. nil].
	^[
		p environmentAt: self put: anObject.
		aBlock value ] 
			ensure: [ outerScopeWasDynamic
				ifTrue: [p environmentAt: self put: oldValue]
				ifFalse: [p environmentRemoveKey: self ifAbsent: []] ].