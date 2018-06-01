building
buildPluggableList: aSpec 
	| w |
	w := ListStub fromSpec: aSpec.
	self register: w id: aSpec name.
	^w