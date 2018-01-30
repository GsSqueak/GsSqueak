initialize-release
forgetDoIts
	"get rid of old DoIt methods"
	self 
		basicRemoveSelector: #DoIt;
		basicRemoveSelector: #DoItIn: