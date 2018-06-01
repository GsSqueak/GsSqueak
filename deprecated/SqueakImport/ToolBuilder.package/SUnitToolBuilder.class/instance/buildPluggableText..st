building
buildPluggableText: aSpec 
	| w |
	w := TextStub fromSpec: aSpec.
	self register: w id: aSpec name.
	^w