modules
forgetModule: aString
	"Primitive. If the module named aString is loaded, unloaded. If not, and it is marked an unloadable, unmark it so the VM will try to load it again next time. See comment for #unloadModule:."
	self notYetImplemented.
	^self primitiveFailed