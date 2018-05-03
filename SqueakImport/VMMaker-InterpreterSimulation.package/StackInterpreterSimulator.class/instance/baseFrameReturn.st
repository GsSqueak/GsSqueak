return bytecodes
baseFrameReturn
	| contextToReturnTo |
	contextToReturnTo := self frameCallerContext: localFP.
	((self isContext: contextToReturnTo)
	 and: [self isMarriedOrWidowedContext: contextToReturnTo]) ifTrue:
		[(self checkIsStillMarriedContext: contextToReturnTo currentFP: nil) ifFalse:
			[self halt]].
	^super baseFrameReturn