postscript generation
bitsPerComponent	^ self depth <= 8		ifTrue: [self depth]		ifFalse: [8]