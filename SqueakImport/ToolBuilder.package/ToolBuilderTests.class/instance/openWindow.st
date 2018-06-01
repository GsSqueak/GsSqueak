tests-window
openWindow
	| spec |
	spec := self makeWindowSpec.
	widget := builder open: spec.