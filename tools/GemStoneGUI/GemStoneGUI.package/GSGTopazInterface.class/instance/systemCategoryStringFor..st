new api - system organizer
systemCategoryStringFor: systemOrganizerProxy

	self flag: #gsg.
	^ '' "self convertToCategoryString: (self systemCategoryDictFor: systemOrganizerProxy subject)"