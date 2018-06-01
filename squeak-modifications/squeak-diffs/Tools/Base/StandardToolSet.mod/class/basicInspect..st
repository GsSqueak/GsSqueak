inspecting
basicInspect: anObject
	"Open an inspector on the given object. The tool set must know which inspector type to use for which object - the object cannot possibly know what kind of inspectors the toolset provides."
	^BasicInspector openOn: anObject