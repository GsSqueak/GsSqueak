images
changesInPreferences
	"the related preferences changed"
	self initializeImagesCache
	"ScrollBar allInstances do: [:each | each removeAllMorphs;
	initializeSlider] "