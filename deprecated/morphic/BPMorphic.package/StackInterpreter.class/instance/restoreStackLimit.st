stack pages
restoreStackLimit
	"restore the stackLimit if it has been smashed."
	stackPage stackLimit: stackPage realStackLimit.
	stackLimit := stackPage stackLimit