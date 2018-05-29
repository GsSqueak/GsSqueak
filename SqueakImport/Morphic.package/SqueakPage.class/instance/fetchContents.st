accessing
fetchContents
	"Make every effort to get contentsMorph."

	self isContentsInMemory ifTrue: [^ contentsMorph].
	^ self fetchInformIfError