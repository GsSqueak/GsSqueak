tests - evaluating
testOnce
	| objs result |
	objs := (1 to: 10) collect: [:ign| [Object new] once].
	self assert: (objs allSatisfy: [:obj| obj == objs first]).
	result := self class onceMethod.
	1 to: 10 do:
		[:ign|
		self assert: result == self class onceMethod]