tests-window
makeWindowSpec
	| spec |
	spec := builder pluggableWindowSpec new.
	spec name: #window.
	spec model: self.
	spec children: #getChildren.
	spec label: #getLabel.
	spec closeAction: #noteWindowClosed.
	^spec