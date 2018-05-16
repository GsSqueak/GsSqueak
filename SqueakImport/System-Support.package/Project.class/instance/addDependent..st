release
addDependent: aMorph

	"Projects do not keep track of their dependents, lest they point into other projects and thus foul up the tree structure for image segmentation."

	^ self  "Ignore this request"