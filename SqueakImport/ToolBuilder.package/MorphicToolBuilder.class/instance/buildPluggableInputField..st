widgets optional
buildPluggableInputField: aSpec
	| widget |
	widget := self buildPluggableText: aSpec.
	widget minimumHeight: 0.
	widget acceptOnCR: true.
	widget hideScrollBarsIndefinitely.
	^widget