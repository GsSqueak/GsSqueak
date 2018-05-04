instance creation
minimal
	"Open a VMMakerTool with a configuration suitable for building a VM with minimal plugin support"
	
	"VMMakerTool minimal"

	| vmm |
	vmm := self new configuration: VMMakerTool minimalSpec.
	vmm buildWindow openInWorld.
	^vmm