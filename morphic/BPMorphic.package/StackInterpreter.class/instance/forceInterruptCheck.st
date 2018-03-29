process primitive support
forceInterruptCheck
	"Force an interrupt check ASAP.
	Must set the stack page's limit before stackLimit to avoid
	a race condition if this is called from an interrupt handler."
	| _gsSqueakTemp_thePage _gsSqueakTemp_iccFunc |
	"Do _not_ set stackLimit until the stack system has been initialized.
	stackLimit is the initialization flag for the stack system."
	stackLimit = 0
		ifTrue: [^ nil].
	_gsSqueakTemp_thePage := stackPage.
	(_gsSqueakTemp_thePage notNil
			and: [_gsSqueakTemp_thePage ~= 0])
		ifTrue: [_gsSqueakTemp_thePage stackLimit: self allOnesAsCharStar].
	stackLimit := self allOnesAsCharStar.
	self sqLowLevelMFence.
	"There is a race condition if we test the function and then dereference
	it a second time to call it. This is called from interrupt code but at the
	same time other code could be clearing the interruptCheckChain via
	setInterruptCheckChain:."
	(_gsSqueakTemp_iccFunc := interruptCheckChain) notNil
		ifTrue: [self perform: _gsSqueakTemp_iccFunc].
	statForceInterruptCheck := statForceInterruptCheck + 1