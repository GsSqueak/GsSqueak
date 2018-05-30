instance creation
newOnClass: aClass messageCategory: aCategory editString: aString label: aLabel
	"Open a new message protocol browser on this class & protocol with aString pre-selected in the code pane.
	We have to be a bit sneaky to do the string insertion since it cannot be handled until after the actual browser is built and opened"

	^self newOnClass: aClass messageCategory: aCategory selector: nil editString: aString label: aLabel