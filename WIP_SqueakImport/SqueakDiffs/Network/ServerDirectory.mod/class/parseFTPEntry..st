misc
parseFTPEntry: ftpEntry
	| tokens longy dateInSeconds thisYear thisMonth |
	thisYear := Date today year.
	thisMonth := Date today monthIndex.
	tokens := ftpEntry findTokens: ' '.
	tokens size = 8 ifTrue:
		[((tokens at: 6) size ~= 3 and: [(tokens at: 5) size = 3]) ifTrue:
			["Fix for case that group is blank (relies on month being 3 chars)"
			tokens := tokens copyReplaceFrom: 4 to: 3 with: {'blank'}]].
	tokens size >= 9 ifFalse:[^nil].

	((tokens at: 6) size ~= 3 and: [(tokens at: 5) size = 3]) ifTrue:
		["Fix for case that group is blank (relies on month being 3 chars)"
		tokens := tokens copyReplaceFrom: 4 to: 3 with: {'blank'}].

	tokens size > 9 ifTrue:
		[ "cmm:  this approach fails for filenames containing two spaces in a row."
		longy := tokens at: 9.
		10 to: tokens size do: [:i | longy := longy , ' ' , (tokens at: i)].
		tokens at: 9 put: longy].
	dateInSeconds := self
		secondsForDay: (tokens at: 7) 
		month: (tokens at: 6) 
		yearOrTime: (tokens at: 8) 
		thisMonth: thisMonth 
		thisYear: thisYear.
	^DirectoryEntry name: (tokens at: 9)  "file name"
		creationTime: dateInSeconds "creation date"
		modificationTime: dateInSeconds "modification time"
		isDirectory: ((tokens first first) = $d or: [tokens first first =$l]) "is-a-directory flag"
		fileSize: tokens fifth asNumber "file size"
