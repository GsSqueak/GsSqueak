building
buildPluggableButton: aSpec
	| w |
	w := ButtonStub fromSpec: aSpec.
	self register: w id: aSpec name.
	^w