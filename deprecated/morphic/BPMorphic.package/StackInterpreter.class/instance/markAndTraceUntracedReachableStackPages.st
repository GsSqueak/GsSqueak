object memory support
markAndTraceUntracedReachableStackPages
	"Trace any untraced pages"
	| _gsSqueakTemp_thePage _gsSqueakTemp_foundToBeTracedPage |
	[_gsSqueakTemp_foundToBeTracedPage := false.
	0
		to: numStackPages - 1
		do: [:i | 
			_gsSqueakTemp_thePage := stackPages stackPageAt: i.
			((stackPages isFree: _gsSqueakTemp_thePage) not
					and: [_gsSqueakTemp_thePage trace = StackPageReachedButUntraced])
				ifTrue: [_gsSqueakTemp_foundToBeTracedPage := true.
					self markAndTraceStackPage: _gsSqueakTemp_thePage]].
	_gsSqueakTemp_foundToBeTracedPage] whileTrue