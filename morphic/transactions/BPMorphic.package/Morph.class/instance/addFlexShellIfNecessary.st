rotate scale and flex
addFlexShellIfNecessary
	"If this morph requires a flex shell to scale or rotate,
	then wrap it in one and return it.
	Polygons, eg, may override to return themselves."
	^ self addFlexShell