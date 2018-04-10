initialize
useDefaultStyler
	"This should be changed to a proper registry but as long as there is
	only shout this will do"
	(self userInterfaceTheme stylerClass
		ifNil: [Smalltalk at: #SHTextStylerST80])
		ifNotNil: [:stylerClass | self
				styler: (stylerClass new view: self)]