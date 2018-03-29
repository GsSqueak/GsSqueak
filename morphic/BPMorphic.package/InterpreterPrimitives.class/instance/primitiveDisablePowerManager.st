system control primitives
primitiveDisablePowerManager
	"Pass in a non-negative value to disable the architectures
	powermanager if any, zero to enable. This is a named (not numbered)
	primitive in the null module (ie the VM)"
	| _gsSqueakTemp_integer |
	_gsSqueakTemp_integer := self stackIntegerValue: 0.
	self successful
		ifTrue: [self ioDisablePowerManager: _gsSqueakTemp_integer.
			self pop: 1]