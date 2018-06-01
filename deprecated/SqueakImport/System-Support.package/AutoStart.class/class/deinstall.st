class initialization
deinstall
	"AutoStart deinstall"

	Smalltalk removeFromStartUpList: AutoStart.
	Smalltalk removeFromShutDownList: AutoStart.
	InstalledLaunchers := nil