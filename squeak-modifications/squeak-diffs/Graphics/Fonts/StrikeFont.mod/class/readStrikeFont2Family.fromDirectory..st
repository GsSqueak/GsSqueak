examples
readStrikeFont2Family: familyName fromDirectory: aDirectory
	"StrikeFont readStrikeFont2Family: 'Lucida' fromDirectory: FileDirectory default"
	"This utility reads all available .sf2 StrikeFont files for a given family from  
	the current directory. It returns an Array, sorted by size, suitable for handing 
	to TextStyle newFontArray: ."
	"For this utility to work as is, the .sf2 files must be named 'familyNN.sf2'."
	| fileNames strikeFonts |
	fileNames := aDirectory fileNamesMatching: familyName , '##.sf2'.
	strikeFonts := fileNames collect: [:fname | StrikeFont new readFromStrike2: (aDirectory fullNameFor: fname)].
	strikeFonts do: [ :font | font reset ].
	^strikeFonts asArray sort: [:a :b | a height < b height].

	"TextConstants at: #Lucida put: (TextStyle fontArray: (StrikeFont  readStrikeFont2Family: 'Lucida' fromDirectory: FileDirectory default))."