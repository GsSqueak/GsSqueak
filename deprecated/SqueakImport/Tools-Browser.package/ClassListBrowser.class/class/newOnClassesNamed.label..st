instance creation
newOnClassesNamed: aListOfClassNames label: aString
	"Open a browser on all the classes in the list, set the label to aString since we may need to specify to the user what the list includes"
	"ClassListBrowser newOnClassesNamed: #(Browser Boolean) label: 'Browser and Boolean!'."		
	| newBrowser |

	newBrowser := self new.
	newBrowser initForClassesNamed: aListOfClassNames.
	^ newBrowser buildAndOpenBrowserLabel: aString
