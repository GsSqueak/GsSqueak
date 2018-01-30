objects from disk
objectForDataStream: refStrm
	"In a 64-bit Spur VM, we may have to fake 32-bit SmallIntegers for compatibility."

	| large |
	self > 16r3FFFFFFF ifTrue: [
		large := LargePositiveInteger new: self digitLength neg: false.
		1 to: self digitLength do: [:i | large digitAt: i put: (self digitAt: i)].
		^large].
	self < -16r40000000 ifTrue: [
		large := LargeNegativeInteger new: self digitLength neg: true.
		1 to: self digitLength do: [:i | large digitAt: i put: (self digitAt: i)].
		^large].
	^ self