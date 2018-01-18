postscript generation
decodeArray	^ self depth <= 8		ifTrue: ['[1 0]']		ifFalse: ['[0 1 0 1 0 1 ]']