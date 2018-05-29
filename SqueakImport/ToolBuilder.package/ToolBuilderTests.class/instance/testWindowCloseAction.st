tests-window
testWindowCloseAction
	self openWindow.
	builder close: widget.
	self assert: (queries includes: #noteWindowClosed).