initialize-release
forgetDoIts
	"get rid of old DoIt methods and bogus entries in the ClassOrganizer."
	SystemChangeNotifier uniqueInstance doSilently: [
		self organization
			removeElement: #DoIt;
			removeElement: #DoItIn:.
	].
	super forgetDoIts.