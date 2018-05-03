summer97 additions
classCategoriesStartingWith: aPrefix
	"Answer a list of system class categories beginning with the given prefix"

	"Utilities classCategoriesStartingWith: 'Files'"

	^ SystemOrganization categories select:
		[:aCat | (aCat asString findString:  aPrefix startingAt: 1) = 1]