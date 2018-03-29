image save/restore
readableFormat: imageVersion 
	"Anwer true if images of the given format are readable by this
	interpreter. Allows a virtual machine to accept selected older image
	formats. "
	^ imageVersion = self imageFormatVersion
		or: ["Float words in platform-order"
			objectMemory hasSpurMemoryManagerAPI not
				and: ["No compatibility version for Spur as yet"
					imageVersion = self imageFormatCompatibilityVersion]
			"Float words in BigEndian order"]