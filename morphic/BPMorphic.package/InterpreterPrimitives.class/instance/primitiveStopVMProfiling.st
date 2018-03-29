process primitives
primitiveStopVMProfiling
	"Primitive. Stop the VM profiler and either copy the histogram data into
	the supplied arguments, if they're non-nil. Fail if the arguments are
	not of the right type or size."
	| _gsSqueakTemp_vmHistArrayOrNil _gsSqueakTemp_vmHist _gsSqueakTemp_vmBins _gsSqueakTemp_easHistArrayOrNil _gsSqueakTemp_easHist _gsSqueakTemp_easBins |
	self success: argumentCount = 2.
	_gsSqueakTemp_vmHistArrayOrNil := self stackObjectValue: 1.
	_gsSqueakTemp_easHistArrayOrNil := self stackObjectValue: 0.
	self successful
		ifFalse: [^ nil].
	"Both args must be either nil or arrays. If they're arrays and the wrong
	size we incorrectly stop profiling."
	((_gsSqueakTemp_vmHistArrayOrNil = objectMemory nilObject
				or: [(objectMemory fetchClassOfNonImm: _gsSqueakTemp_vmHistArrayOrNil)
						= (objectMemory splObj: ClassArray)])
			and: [(objectMemory fetchClassOfNonImm: _gsSqueakTemp_vmHistArrayOrNil)
					= (objectMemory fetchClassOfNonImm: _gsSqueakTemp_easHistArrayOrNil)])
		ifFalse: [^ self primitiveFail].
	self
		cCode: 'ioControlProfile(0,&vmHist,&vmBins,&easHist,&easBins)'
		inSmalltalk: [_gsSqueakTemp_vmHist := _gsSqueakTemp_vmBins := _gsSqueakTemp_easHist := _gsSqueakTemp_easBins := 0].
	_gsSqueakTemp_vmHistArrayOrNil ~= objectMemory nilObject
		ifTrue: [((objectMemory numSlotsOf: _gsSqueakTemp_vmHistArrayOrNil)
						= _gsSqueakTemp_vmBins
					and: [(objectMemory numSlotsOf: _gsSqueakTemp_easHistArrayOrNil)
							= _gsSqueakTemp_easBins])
				ifFalse: [^ self primitiveFail].
			0
				to: _gsSqueakTemp_vmBins - 1
				do: [:i | objectMemory
						storePointerUnchecked: i
						ofObject: _gsSqueakTemp_vmHistArrayOrNil
						withValue: (objectMemory
								integerObjectOf: (_gsSqueakTemp_vmHist at: i))].
			0
				to: _gsSqueakTemp_easBins - 1
				do: [:i | objectMemory
						storePointerUnchecked: i
						ofObject: _gsSqueakTemp_easHistArrayOrNil
						withValue: (objectMemory
								integerObjectOf: (_gsSqueakTemp_easHist at: i))]].
	self pop: argumentCount