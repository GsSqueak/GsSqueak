accessing
allKnownDomains
	"Every package has its own text domain now so it's not necessary to keep a registry of all domains, we can simply return all the packages in the image.
	PROBLEM: If a package doesn't contain translations, it won't have a mo file but the GetTextTranslator will try to load it anyway. This happens when we switch languages. So far I tested it briefly and it seems to work..."
	^PackageOrganizer default packageNames , {'Etoys-Tiles'}