instance creation
basicNew: size 
	^ (size = CompiledMethod smallFrameSize or: [ size = CompiledMethod fullFrameSize ])
		ifTrue: [ super basicNew: size ]
		ifFalse: [ self error: 'Contexts must be ' , CompiledMethod smallFrameSize , ' or ' , CompiledMethod fullFrameSize , ' bytes.' ]