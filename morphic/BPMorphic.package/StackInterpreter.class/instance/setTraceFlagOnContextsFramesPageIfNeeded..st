object memory support
setTraceFlagOnContextsFramesPageIfNeeded: aContext 
	| _gsSqueakTemp_thePage |
	(self isStillMarriedContextDuringGC: aContext)
		ifTrue: [_gsSqueakTemp_thePage := stackPages
						stackPageFor: (self frameOfMarriedContext: aContext).
			self
				assert: (_gsSqueakTemp_thePage trace between: StackPageUnreached and: StackPageTraced).
			_gsSqueakTemp_thePage trace = StackPageUnreached
				ifTrue: [_gsSqueakTemp_thePage trace: StackPageReachedButUntraced]]