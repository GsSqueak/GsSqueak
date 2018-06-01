building
buildPluggableTree: aSpec
	| w |
	w := TreeStub fromSpec: aSpec.
	self register: w id: aSpec name.
	^w