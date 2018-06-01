toolbuilder
setupIfNotInitialisedYet
	"ClassListBrowser needs some initialisation to work in the ToolBuilder>build: world since there has to be a list of classes ready to be listed. As a default we use the full list of classes in the system"

	classDisplayList ifNil:[self initAlphabeticListing]