debug and other
defineTempCommand
	"To use this, comment out what's below here, and substitute your own code.
You will then be able to invoke it from the standard debugging menus.  If invoked from the world menu, you'll always get it invoked on behalf of the world, but if invoked from an individual morph's meta-menu, it will be invoked on behalf of that individual morph.

Note that you can indeed reimplement tempCommand in an individual morph's class if you wish"

	ToolSet browse: Morph
		selector: #tempCommand