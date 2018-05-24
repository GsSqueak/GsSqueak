debug and other
tempCommand
	"Generic backstop.  If you care to, you can comment out what's below here, and substitute your own code, though the intention of design of the feature is that you leave this method as it is, and instead reimplement tempCommand in the class of whatever individual morph you care to.  In any case, once you have your own #tempCommand in place, you will then be able to invoke it from the standard debugging menus."

	self inform: 'Before calling tempCommand, you
should first give it a definition.  To
do this, choose "define tempCommand"
from the debug menu.' translated