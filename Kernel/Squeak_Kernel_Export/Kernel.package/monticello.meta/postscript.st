(PackageInfo named: 'Kernel') postscript: '"below, add code to be run after the loading of this package"

"Arrange that SmalFloat64 has identityHash 4 and is in the class table first page if possible.
 Don''t bother to rehash all hashed collections; SmallFloat64 is not in any in the default image"
Smalltalk garbageCollect.
(Array someInstance size = 1024
and: [(Array someInstance allSatisfy: [:e| e == nil or: [e isBehavior]])
and: [(Array someInstance first: 17) =  {nil . SmallInteger . Character . SmallInteger . nil . nil . nil . nil . nil . nil . nil . nil . nil . nil . nil . nil . Array}]]) ifTrue:
	[SmallFloat64 tryPrimitive: 161 withArgs: #(4).
	 Array someInstance at: 5 put: SmallFloat64]'!
