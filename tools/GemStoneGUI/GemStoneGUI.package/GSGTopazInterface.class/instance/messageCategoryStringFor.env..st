new api - class organizer
messageCategoryStringFor: classOrganizerProxy env: envId

	^ self convertToCategoryString: (self messageCategoryDictFor: classOrganizerProxy subject env: envId)