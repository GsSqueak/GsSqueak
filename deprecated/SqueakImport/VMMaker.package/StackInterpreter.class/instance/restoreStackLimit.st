stack pages
restoreStackLimit
	"restore the stackLimit if it has been smashed."
	<inline: true>
	stackPage setStackLimit: stackPage realStackLimit.
	stackLimit := stackPage stackLimit