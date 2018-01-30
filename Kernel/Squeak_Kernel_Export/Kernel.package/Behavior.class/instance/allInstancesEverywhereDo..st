enumerating
allInstancesEverywhereDo: aBlock 
	"Evaluate the argument, aBlock, for each of the current instances of the receiver.  Including those in ImageSegments that are out on the disk.  Bring each in briefly."

	self ==  UndefinedObject ifTrue: [^ aBlock value: nil].
	self allInstancesDo: aBlock.
	"Now iterate over instances in segments that are out on the disk."
	ImageSegment allSubInstancesDo: [:seg |
		seg allInstancesOf: self do: aBlock].
