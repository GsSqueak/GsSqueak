instance creation
newOnClass: aClass messageCategory: aCategory selector: aSelector editString: aString label: aLabel
	"Open a new message protocol browser on this class & protocol with aString pre-selected in the code pane.
	We have to be a bit sneaky to do the string insertion since it cannot be handled until after the actual browser is built and opened"
	"Browser newOnClass: Browser messageCategory: 'controls' selector: #decorateButtons editString: 'test string edit setup' label: 'Testing class browser with set edit string'"
	| newBrowser|

	newBrowser := self new.
	"setting up a new browser for a specific class, category and selector requires this order of messages
	since the #selectMessageCategoryNamed: carefully nils the chosen selector; thus we can't use
	the more obvious seeming #setClass:selector: method"
	newBrowser
		setClass: aClass;
		selectMessageCategoryNamed: aCategory;
		selectMessageNamed: aSelector;
		editSelection: #editMessage.

	newBrowser buildAndOpenMessageCategoryBrowserLabel: 'Message Category Browser (' , aClass name, ')'.
	aString ifNotNil:[newBrowser changed: #editString with: aString].
	^newBrowser