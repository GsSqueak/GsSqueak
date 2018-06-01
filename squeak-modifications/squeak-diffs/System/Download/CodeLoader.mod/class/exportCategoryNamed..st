utilities
exportCategoryNamed: catName
	"CodeLoader exportCategoryNamed: 'OceanicPanic' "

	| list |
	list := SystemOrganization listAtCategoryNamed: catName asSymbol.
	self exportClassesNamed: list to: catName