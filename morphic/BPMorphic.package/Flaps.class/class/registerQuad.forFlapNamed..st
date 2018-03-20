flaps registry
registerQuad: aQuad forFlapNamed: aLabel 
	"If any previous registration of the same label string is already known,
	delete the old one."
	"aQuad received must be an array of the form {TargetObject.
	#command label 'A Help String'} 
	
	Flaps registerQuad: #(FileList2 openMorphicViewInWorld	'Enhanced
	File List'	'A nicer File List.')
	forFlapNamed: 'Tools'"
	self unregisterQuad: aQuad forFlapNamed: aLabel.
	(self registeredFlapsQuads
		at: aLabel
		ifAbsent: [^ self])
		add: aQuad