inspecting
inspectorClassOf: anObject 
	"Answer the inspector class for the given object. The tool set must
	know which inspector type to use for which object - the object cannot
	possibly know what kind of inspectors the toolset provides."
	self default
		ifNil: [^ nil].
	^ self default inspectorClassOf: anObject