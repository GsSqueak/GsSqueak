file list services
serviceInstallTrueTypeFontStyle
	"Return a service to install a true type font as a text style"

	^ SimpleServiceEntry
		provider: self
		label: 'install ttf style'
		selector: #newTextStyleFromTTFile: 
		description: 'install a true type font as a text style'
		buttonLabel: 'install ttf'