as yet unclassified
currentTextAttVersion
	"The current configuration of the TextAttributes classes has a structures array describing the inst vars of the classes (SmartRefStream instVarInfo:).  Return tag that indexes the TextAttributeStructureVersions dictionary (4 random characters)."

	^ CurrentTextAttVersion
	"Be sure to run makeNewTextAttVersion when any TextAttributes class changes inst vars"