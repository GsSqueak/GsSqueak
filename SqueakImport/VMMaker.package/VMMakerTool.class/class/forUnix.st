instance creation
forUnix
	"Open a VMMakerTool with a configuration suitable for a typical unix platform"
	
	"VMMakerTool forUnix"

	| vmm |
	vmm := self new configuration: VMMakerTool defaultUnixSpec.
	vmm buildWindow openInWorld.
	^vmm