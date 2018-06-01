accessing
copyForSaving
	"Make a copy and configure me to be put out on the disk.  When it is brought in and touched, it will turn into the object at the url."

	| forDisk holder |
	forDisk := self shallowCopy.
	holder := MorphObjectOut new xxxSetUrl: url page: forDisk.
	forDisk contentsMorph: holder.
	^ holder		"directly representing the object"