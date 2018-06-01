instance creation
newOnCategory: aCategory editString: aString label: aLabel
	"Open a new browser on this category (testing first for existence) with aString pre-selected in the code pane.
	We have to be a bit sneaky to do the string insertion since it cannot be handled until after the actual browser is built and opened"

	"Browser newOnCategory: 'Tools-Browser' editString: 'test string edit setup' label: 'Testing category browser with set edit string'"

	| newBrowser |
	newBrowser := self newOnCategory: aCategory label: aLabel.
	aString ifNotNil:[newBrowser changed: #editString with: aString].
	^ newBrowser
	
