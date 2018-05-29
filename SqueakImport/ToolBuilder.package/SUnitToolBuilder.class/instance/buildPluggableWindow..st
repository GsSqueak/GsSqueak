building
buildPluggableWindow: aSpec
	| window children |
	window := WindowStub fromSpec: aSpec.
	children := aSpec children.
	children isSymbol 
		ifFalse: [window children: (children collect: [:ea | ea buildWith: self])].
	self register: window id: aSpec name.
	^ window