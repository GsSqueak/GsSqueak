frame access
moveFramesIn: oldPage through: theFP toPage: newPage 
	"Move frames from the hot end of oldPage through to theFP to
	newPage. This has the effect of making theFP a base frame which can
	be stored into.
	Answer theFP's new location."
	| _gsSqueakTemp_newSP _gsSqueakTemp_newFP _gsSqueakTemp_stackedReceiverOffset _gsSqueakTemp_delta _gsSqueakTemp_callerFP _gsSqueakTemp_callerIP _gsSqueakTemp_fpInNewPage _gsSqueakTemp_offsetCallerFP _gsSqueakTemp_theContext |
	_gsSqueakTemp_newSP := newPage baseAddress + objectMemory wordSize.
	_gsSqueakTemp_stackedReceiverOffset := self frameStackedReceiverOffset: theFP.
	"First move the data. We will fix up frame pointers later."
	theFP + _gsSqueakTemp_stackedReceiverOffset
		to: oldPage headSP
		by: objectMemory wordSize negated
		do: [:source | 
			_gsSqueakTemp_newSP := _gsSqueakTemp_newSP - objectMemory wordSize.
			stackPages
				longAt: _gsSqueakTemp_newSP
				put: (stackPages longAt: source)].
	"newSP = oldSP + delta => delta = newSP - oldSP"
	_gsSqueakTemp_delta := _gsSqueakTemp_newSP - oldPage headSP.
	_gsSqueakTemp_newFP := newPage baseAddress - _gsSqueakTemp_stackedReceiverOffset.
	self
		setHeadFP: oldPage headFP + _gsSqueakTemp_delta
		andSP: _gsSqueakTemp_newSP
		inPage: newPage.
	newPage baseFP: _gsSqueakTemp_newFP.
	_gsSqueakTemp_callerFP := self frameCallerFP: theFP.
	self assert: (self isBaseFrame: theFP) not.
	self
		assert: (self frameHasContext: _gsSqueakTemp_callerFP).
	_gsSqueakTemp_callerIP := self
				oopForPointer: (self frameCallerSavedIP: theFP).
	stackPages longAt: theFP + _gsSqueakTemp_stackedReceiverOffset put: _gsSqueakTemp_callerIP.
	self
		assert: (_gsSqueakTemp_callerFP < oldPage baseAddress
				and: [_gsSqueakTemp_callerFP > (oldPage realStackLimit - (LargeContextSlots * objectMemory bytesPerOop / 2))]).
	oldPage headFP: _gsSqueakTemp_callerFP;
		 headSP: theFP + _gsSqueakTemp_stackedReceiverOffset.
	"Mark the new base frame in the new page (FoxCallerContext a.k.a.
	FoxCallerSavedIP) "
	stackPages
		longAt: _gsSqueakTemp_newFP + FoxCallerContext
		put: (self frameContext: _gsSqueakTemp_callerFP).
	stackPages longAt: _gsSqueakTemp_newFP + FoxSavedFP put: 0.
	"Now relocate frame pointers, updating married contexts to refer to
	their moved spouse frames."
	_gsSqueakTemp_fpInNewPage := newPage headFP.
	[_gsSqueakTemp_offsetCallerFP := self frameCallerFP: _gsSqueakTemp_fpInNewPage.
	_gsSqueakTemp_offsetCallerFP ~= 0
		ifTrue: [_gsSqueakTemp_offsetCallerFP := _gsSqueakTemp_offsetCallerFP + _gsSqueakTemp_delta].
	stackPages
		longAt: _gsSqueakTemp_fpInNewPage + FoxSavedFP
		put: (self oopForPointer: _gsSqueakTemp_offsetCallerFP).
	(self frameHasContext: _gsSqueakTemp_fpInNewPage)
		ifTrue: [_gsSqueakTemp_theContext := self frameContext: _gsSqueakTemp_fpInNewPage.
			objectMemory
				storePointerUnchecked: SenderIndex
				ofObject: _gsSqueakTemp_theContext
				withValue: (self withSmallIntegerTags: _gsSqueakTemp_fpInNewPage).
			objectMemory
				storePointerUnchecked: InstructionPointerIndex
				ofObject: _gsSqueakTemp_theContext
				withValue: (self withSmallIntegerTags: _gsSqueakTemp_offsetCallerFP)].
	_gsSqueakTemp_fpInNewPage := _gsSqueakTemp_offsetCallerFP.
	_gsSqueakTemp_fpInNewPage ~= 0] whileTrue.
	^ _gsSqueakTemp_newFP