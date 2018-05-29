opening
openDebugger: aSpec
	"Build and open a debugger from the given spec.
	Answer the widget opened. Subclasses can override this
	method if opening a debugger has specific requirements
	different from opening other widgets."
 
	self open: aSpec
