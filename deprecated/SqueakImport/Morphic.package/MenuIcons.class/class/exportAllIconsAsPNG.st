import/export
exportAllIconsAsPNG
	"self exportAllIconsAsPNG"

	| sels | 
	sels := self class selectors select: [:each |  '*Icon' match: each asString].
	sels do: [:each | self exportIcon: (MenuIcons perform: each) asPNGNamed: each asString].
