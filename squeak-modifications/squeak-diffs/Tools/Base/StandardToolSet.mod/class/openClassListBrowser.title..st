browsing
openClassListBrowser: anArray title: aString
	"Open a class list browser on the list of classes named"

	^ClassListBrowser newOnClassesNamed: anArray label: aString
