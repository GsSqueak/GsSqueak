navigation
goToPageMorph: aMorph runTransitionScripts: aBoolean 
	"Set the given morph as the current page. If the boolean parameter is
	true, then opening and closing scripts will be run"
	self
		goToPage: (pages
				identityIndexOf: aMorph
				ifAbsent: [^ self"abort"])
		transitionSpec: nil
		runTransitionScripts: aBoolean