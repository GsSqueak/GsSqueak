instance creation
newOnClass: aClass selector: aSymbol
	"Open a new class browser on this class."
	"Browser newOnClass: Browser selector: #decorateButtons"
	| newBrowser |

	newBrowser := self new.
	newBrowser setClass: aClass selector: aSymbol.
	^ newBrowser buildAndOpenClassBrowserLabel: 'Class Browser: ', aClass name
