stack pages
validStackPageBaseFrame: aPage 
	"Check that the base frame in the stack page has a valid sender
	context. "
	| _gsSqueakTemp_senderContextOrNil |
	(self
			asserta: (self isBaseFrame: aPage baseFP))
		ifFalse: [^ false].
	_gsSqueakTemp_senderContextOrNil := self frameCallerContext: aPage baseFP.
	(self
			asserta: (objectMemory addressCouldBeObj: _gsSqueakTemp_senderContextOrNil))
		ifFalse: [^ false].
	(self
			asserta: (_gsSqueakTemp_senderContextOrNil = objectMemory nilObject
					or: [objectMemory isContext: _gsSqueakTemp_senderContextOrNil]))
		ifFalse: [^ false].
	^ true