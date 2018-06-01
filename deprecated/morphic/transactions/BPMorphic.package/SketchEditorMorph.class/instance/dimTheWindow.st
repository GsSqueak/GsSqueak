palette handling
dimTheWindow
	"Updated to use TranslucentColor by kfr 10/5 00"
	"Do not call twice! Installs a morph with an 'onion-skinned' copy of the
	pixels behind me."
	"create an 'onion-skinned' version of the stuff on the screen"
	owner
		outermostMorphThat: [:morph | 
			morph resumeAfterDrawError.
			false]