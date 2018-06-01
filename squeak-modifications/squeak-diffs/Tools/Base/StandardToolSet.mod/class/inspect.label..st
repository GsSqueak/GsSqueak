inspecting
inspect: anObject label: aString
	"Open an inspector on the given object. The tool set must know which inspector type to use for which object - the object cannot possibly know what kind of inspectors the toolset provides."
	^ anObject inspectorClass openOn: anObject withEvalPane: true withLabel: aString