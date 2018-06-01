building
buildPluggablePanel: aSpec
	| w |
	w := PanelStub fromSpec: aSpec.
	self register: w id: aSpec name.
	^w