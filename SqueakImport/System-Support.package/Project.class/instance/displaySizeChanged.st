displaying
displaySizeChanged
	"Inform the current project that its display size has changed. Usually, projects invalidate all their drawing caches and restore their graphical contents."

	self invalidate; restore.