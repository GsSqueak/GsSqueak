*SqCollectionLiterals-private
replaceFrom: start to: stop with: replacement startingAt: repStart 
replacement isString
		ifFalse:
			[super replaceFrom: start to: stop with: replacement startingAt: repStart]
		ifTrue:
			[ "use String>>byteAt: to mimic prim 105"
			| index repOff |
			repOff := repStart - start.
			index := start - 1.
			[(index := index + 1) <= stop]
				whileTrue: [self at: index put: (replacement byteAt: repOff + index)]]

