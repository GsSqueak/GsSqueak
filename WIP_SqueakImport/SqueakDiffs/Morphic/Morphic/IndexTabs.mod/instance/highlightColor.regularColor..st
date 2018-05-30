highlighting
highlightColor: color1 regularColor: color2
	"Apply these colors to all of the receiver's tabs"
	highlightColor := color1.
	regularColor := color2.
	self tabMorphs do:
		[:m | m highlightColor: color1.  m regularColor: color2]