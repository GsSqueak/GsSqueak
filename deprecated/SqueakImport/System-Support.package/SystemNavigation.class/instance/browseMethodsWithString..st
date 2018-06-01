browse
browseMethodsWithString: aString
	"Launch a browser on all methods that contain string literals with aString as a substring. The search is case-insensitive, unless the shift key is pressed, in which case the search is case-sensitive."

	'string for testing'.
	^ self browseMethodsWithString: aString matchCase: Sensor shiftPressed

	"SystemNavigation new browseMethodsWithString: 'Testing' matchCase: false"
	"SystemNavigation new browseMethodsWithString: 'Testing' matchCase: true"