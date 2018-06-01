path and pattern
listForPatterns: arrayOfPatterns
	"build lists of name, date and size for those file names which match any of the patterns in the array.
	We use a Set to avoid duplicates and sort them by name"

	| newList |
	newList := Set new.
	newList addAll: (self entriesMatching: arrayOfPatterns).

	newList := newList sorted: [:a :b|
							a name <= b name].
	nameList := newList collect:[:e| e name].
	dateList := newList collect:[:e| ((Date fromSeconds: e modificationTime )
					printFormat: #(3 2 1 $. 1 1 2)) , ' ' ,
				(String streamContents: [:s |
					(Time fromSeconds: e modificationTime \\ 86400)
						print24: true on: s])].
	sizeList := newList collect:[:e| e  fileSize asStringWithCommas] 
