primitive support
signalNoResume: aSemaphore 
	"Signal the given semaphore from within the interpreter. Used to
	serialize callbacks."
	| _gsSqueakTemp_empty |
	_gsSqueakTemp_empty := self isEmptyList: aSemaphore.
	_gsSqueakTemp_empty
		ifFalse: [self
				putToSleep: (self removeFirstLinkOfList: aSemaphore)
				yieldingIf: true].
	^ _gsSqueakTemp_empty