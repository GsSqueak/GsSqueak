drawing
safeProjectName
	| projectName args |
	projectName := self valueOfProperty: #SafeProjectName ifAbsent: ['???'].
	self isTheRealProjectPresent 
		ifFalse: 
			[project class == DiskProxy 
				ifTrue: 
					[args := project constructorArgs.
					((args isKindOf: Array) 
						and: [args size = 1 and: [args first isString]]) 
							ifTrue: [^args first]]
				ifFalse: [^projectName]].
	self setProperty: #SafeProjectName toValue: project name.
	^project name