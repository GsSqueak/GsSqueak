opening
openDebugger: aSpec label: aString closing: topView
	"Build and open a debugger from the given spec, labeling it appropriately.
	Answer the widget opened. Subclasses can override this
	method if opening a debugger has specific requirements
	different from opening other widgets."
 
	self close: topView.
	self open: aSpec label: aString
