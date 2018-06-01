private
createImplementingMethod
	"Should only be called when this Debugger was created in response to a
	NotYetImplemented exception. All we need to do is pop the signalling context off the stack and open the #notYetImplemented method."
	| signallingContext |
	signallingContext := self selectedContext sender.
	"Pop the signalling context off the stack"
	self resetContext: signallingContext.
	self debug.