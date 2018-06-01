file in/out
exportSegmentWithCatagories: catList classes: classList fileName: aFileName directory: aDirectory
	"Store my project out on the disk as an *exported* ImageSegment.  All outPointers will be in a form that can be resolved in the target image.  Name it <project name>.extSeg.  What do we do about subProjects, especially if they are out as local image segments?  Force them to come in?
	Player classes are included automatically."

	self flag: #toRemove.
	self subclassResponsibility
