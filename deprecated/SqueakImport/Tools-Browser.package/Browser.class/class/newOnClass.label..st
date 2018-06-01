instance creation
newOnClass: aClass label: aLabel
	"Open a new class browser on this class and set the label."
	"Browser newOnClass: Browser label: 'A specific label that I want'"
	| newBrowser |

	newBrowser := self new.
	newBrowser setClass: aClass.
	^ newBrowser buildAndOpenClassBrowserLabel: aLabel
