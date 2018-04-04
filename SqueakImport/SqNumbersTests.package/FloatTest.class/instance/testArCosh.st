tests - mathematical functions
testArCosh
	self assert: 1.0 arCosh = 0.0.
	self deny: Float infinity arCosh isFinite.
	self assert: (2.5 arCosh cosh closeTo: 2.5).