object memory support
markAndTraceStackPages: fullGCFlag 
	"GC of pages. Throwing away all stack pages on full GC is simple but
	dangerous because it causes us to allocate lots of contexts
	immediately before a GC.
	Reclaiming pages whose top context is not referenced is poor because
	it would
	take N incrementalGCs to reclaim N unused pages. Only the page
	whose top
	context is not referred to by the bottom context of any other page
	would be
	reclaimed. Not until the next GC would the page whose top contect is
	the previously reclaimed page's base frame's bottom context be
	reclaimed. 
	Better is to not mark stack pages until their contexts are
	encountered. We can
	eagerly trace the active page and the page reachable from its bottom
	context if any, and so on. Other pages can be marked when we
	encounter a married
	context."
	| _gsSqueakTemp_thePage _gsSqueakTemp_context |
	objectMemory hasSpurMemoryManagerAPI
		ifFalse: [self initStackPageGC].
	"On an incremental GC simply consider all non-free stack pages to be
	roots. "
	fullGCFlag
		ifFalse: [0
				to: numStackPages - 1
				do: [:i | 
					_gsSqueakTemp_thePage := stackPages stackPageAt: i.
					(stackPages isFree: _gsSqueakTemp_thePage)
						ifFalse: [self markAndTraceStackPage: _gsSqueakTemp_thePage]].
			^ nil].
	"On a full GC only eagerly trace pages referenced from
	the base of the active page, i.e. on the active stack."
	stackPage = 0
		ifTrue: [^ nil].
	_gsSqueakTemp_thePage := stackPage.
	[self markAndTraceStackPage: _gsSqueakTemp_thePage.
	_gsSqueakTemp_context := self frameCallerContext: _gsSqueakTemp_thePage baseFP.
	((objectMemory isContext: _gsSqueakTemp_context)
			and: [(self isMarriedOrWidowedContext: _gsSqueakTemp_context)
					and: [self isStillMarriedContext: _gsSqueakTemp_context]])
		ifTrue: [_gsSqueakTemp_thePage := stackPages
						stackPageFor: (self frameOfMarriedContext: _gsSqueakTemp_context).
			self assert: (stackPages isFree: _gsSqueakTemp_thePage) not].
	_gsSqueakTemp_thePage trace < StackPageTraced] whileTrue