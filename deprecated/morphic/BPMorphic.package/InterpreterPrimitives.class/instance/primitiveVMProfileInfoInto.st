process primitives
primitiveVMProfileInfoInto
	"Primitive. Answer whether the profiler is running or not.
	If the argument is an Array of suitable size fill it with the following
	information: 1. the addresses of the first element of the VM histogram
	(the first address in the executable)
	2. the address following the last element (the last address in the
	executable, excluding dynamically linked libraries)
	3. the size of the VM histogram in bins (each bin is a 4 byte unsigned
	long) 4. the size of the VM histogram in bins (each bin is a 4 byte
	unsigned long)"
	| _gsSqueakTemp_info _gsSqueakTemp_running _gsSqueakTemp_exeStart _gsSqueakTemp_exeLimit _gsSqueakTemp_vmBins _gsSqueakTemp_easBins |
	self success: argumentCount = 1.
	self successful
		ifTrue: [_gsSqueakTemp_info := self stackObjectValue: 0].
	self successful
		ifTrue: [_gsSqueakTemp_info ~= objectMemory nilObject
				ifTrue: [self
						assertClassOf: _gsSqueakTemp_info
						is: (objectMemory splObj: ClassArray).
					self success: (objectMemory numSlotsOf: _gsSqueakTemp_info)
							>= 4]].
	self successful
		ifFalse: [^ nil].
	self
		cCode: 'ioProfileStatus(&running,&exeStart,&exeLimit,0,&vmBins,0,&easBins)'
		inSmalltalk: [_gsSqueakTemp_running := _gsSqueakTemp_exeStart := _gsSqueakTemp_exeLimit := _gsSqueakTemp_vmBins := _gsSqueakTemp_easBins := 0].
	_gsSqueakTemp_info ~= objectMemory nilObject
		ifTrue: [objectMemory
				storePointerUnchecked: 0
				ofObject: _gsSqueakTemp_info
				withValue: (objectMemory
						integerObjectOf: (self oopForPointer: _gsSqueakTemp_exeStart)).
			objectMemory
				storePointerUnchecked: 1
				ofObject: _gsSqueakTemp_info
				withValue: (objectMemory
						integerObjectOf: (self oopForPointer: _gsSqueakTemp_exeLimit)).
			objectMemory
				storePointerUnchecked: 2
				ofObject: _gsSqueakTemp_info
				withValue: (objectMemory integerObjectOf: _gsSqueakTemp_vmBins).
			objectMemory
				storePointerUnchecked: 3
				ofObject: _gsSqueakTemp_info
				withValue: (objectMemory integerObjectOf: _gsSqueakTemp_easBins)].
	self pop: 2 thenPushBool: _gsSqueakTemp_running