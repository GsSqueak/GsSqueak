query assembly
codeReferencingMe

	^ self isMeta
		ifTrue: [self codeReferencingInstanceSide , ' class']
		ifFalse: [self codeReferencingInstanceSide]