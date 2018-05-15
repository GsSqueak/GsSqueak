snapshot and quit
quitPrimitive: exitCode
	"Primitive. Exit with exitCode to another operating system on the host machine, if one exists. All state changes in the object space since the last snapshot are lost. Ignore exitCode if it's not supported by the VM."

	self notYetImplemented.
	self quitPrimitive