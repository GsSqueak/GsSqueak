A Categorizer goal is to classify the elements of a collection into categories.
It is typically used to classify methods of class into categories (also named protocols in this case).

Instance Variables
	categoryArray:		<SequenceableCollection of: Object>
	categoryStops:		<SequenceableCollection of: Integer>
	elementArray:		<SequenceableCollection of: Object>

categoryArray
	- holds the list of categories.
	A category could be any Object but is generally a String or Symbol.
	Categories should be unique (categoryArray asSet size = categoryArray size)

categoryStops
	- holds the index of last element belonging to each category.
	There should be a category stop for each category (categoryStops size = categoryArray size).
	The categoryStops should be sorted (categoryStops sorted = categoryStops).
	A category stop equal to its predecessor (= 0 for the first category stop) denotes an empty category.

elementArray
	- holds the elements to be classified. The elements are sorted by category.

Class variables
	Default is the default category used to classify yet unclassified methods of a class
	NullCategory is the category to be displayed in a Browser for a class having no method.
