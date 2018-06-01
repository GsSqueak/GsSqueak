instance creation
newOnClass: aClass editString: aString label: aLabel
	"Open a new class browser on this class with aString pre-selected in the code pane.
	We have to be a bit sneaky to do the string insertion since it cannot be handled until after the actual browser is built and opened"
	"Browser newOnClass: Browser editString: 'test string edit setup' label: 'Testing category browser with set edit string'"
	| newBrowser|

	newBrowser := self newOnClass: aClass label: aLabel.
	newBrowser editSelection: #newMessage.
	aString ifNotNil:[newBrowser changed: #editString with: aString].
	^ newBrowser
