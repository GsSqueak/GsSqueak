initialization
initAlphabeticListing
	| tab stab index |
	self systemOrganizer: SystemOrganization.
	metaClassIndicated := false.
	classDisplayList := Smalltalk classNames.