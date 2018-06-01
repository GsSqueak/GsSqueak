instance creation
newOnAllClasses
	"Open a browser on all the classes in the system, listed alphabetically"
	"NB - what meaning does 'all classes' have in an environment that is not the root?
		- what might alphabetic ordering need to do for non-latin languages?"
	"ClassListBrowser newOnAllClasses"
		
	| newBrowser |

	newBrowser := self new.
	^ newBrowser buildAndOpenBrowserLabel: 'All Classes Alphabetically'
