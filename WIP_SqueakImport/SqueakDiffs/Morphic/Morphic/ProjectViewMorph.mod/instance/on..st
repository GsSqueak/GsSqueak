events
on: aProject

	project := aProject.
	self addProjectNameMorphFiller.
	lastProjectThumbnail := nil.
	project thumbnail
		ifNil: [self extent: 100@80]		"more like screen dimensions?"
		ifNotNil: [self extent: project thumbnail extent].
