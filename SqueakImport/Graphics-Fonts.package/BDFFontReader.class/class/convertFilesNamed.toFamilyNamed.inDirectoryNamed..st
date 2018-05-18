file creation
convertFilesNamed: fileName toFamilyNamed: familyName inDirectoryNamed: dirName
		"BDFFontReader convertFilesNamed: 'helvR' toFamilyNamed: 'Helvetica' inDirectoryNamed: '' "

	"This utility converts X11 BDF font files to Squeak .sf2 StrikeFont files."

	"For this utility to work as is, the BDF files must be named 'familyNN.bdf',
	and must reside in the directory named by dirName (use '' for the current directory).
	The output StrikeFont files will be named familyNN.sf2, and will be placed in the
	current directory."

	| allFontNames dir |
	"Check for matching file names."
	dir := dirName isEmpty
		ifTrue: [FileDirectory default]
		ifFalse: [FileDirectory default directoryNamed: dirName].
	allFontNames := dir fileNamesMatching: fileName , '##.bdf'.
	allFontNames isEmpty ifTrue: [^ self error: 'No files found like ' , fileName , 'NN.bdf'].
	
	UIManager default informUserDuring: [:info |
		allFontNames do: [:fname | | f sizeChars | 
			info value: 'Converting ', familyName, ' BDF file ', fname, ' to SF2 format'.
			sizeChars := (fname copyFrom: fileName size + 1 to: fname size) copyUpTo: $. .

			f := StrikeFont new readBDFFromFile: (dir fullNameFor: fname) name: familyName, sizeChars.
			f writeAsStrike2named: familyName, sizeChars, '.sf2'.
		].
	]