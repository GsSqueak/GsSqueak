inspecting
basicInspect: anObject
	"Open an inspector on the given object. The tool set must know which inspector type to use for which object - the object cannot possibly know what kind of inspectors the toolset provides."
	self default ifNil:[^self inform: 'Cannot inspect -- no Inspector present'].
	^self default basicInspect: anObject