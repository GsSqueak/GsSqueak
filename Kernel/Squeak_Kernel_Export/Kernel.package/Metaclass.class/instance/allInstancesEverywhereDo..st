enumerating
allInstancesEverywhereDo: aBlock
	"There should be only one"
	thisClass class == self ifTrue:[^ aBlock value: thisClass].
	^ super allInstancesEverywhereDo: aBlock