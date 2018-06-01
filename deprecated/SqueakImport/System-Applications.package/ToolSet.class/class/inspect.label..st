inspecting
inspect: anObject label: aString
	"Open an inspector on the given object. The tool set must know which inspector type to use for which object - the object cannot possibly know what kind of inspectors the toolset provides."
	self default ifNil:[^self inform: 'Cannot inspect - no ToolSet present'].
	^self default inspect: anObject label: aString