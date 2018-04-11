private
addPath: aString 
	"Add the given string to the list of recently visited directories."
	| _gsSqueakTemp_full |
	aString
		ifNil: [^ self].
	_gsSqueakTemp_full := String
				streamContents: [:strm | 2
						to: volList size
						do: [:i | 
							strm nextPutAll: (volList at: i) withBlanksTrimmed.
							strm nextPut: FileDirectory pathNameDelimiter]].
	_gsSqueakTemp_full := _gsSqueakTemp_full , aString.
	"Remove and super-directories of aString from the collection."
	RecentDirs
		removeAllSuchThat: [:aDir | aDir , '*' match: _gsSqueakTemp_full].
	"If a sub-directory is in the list, do nothing."
	(RecentDirs
			anySatisfy: [:aDir | _gsSqueakTemp_full , '*' match: aDir])
		ifTrue: [^ self].
	[RecentDirs size >= 10]
		whileTrue: [RecentDirs removeFirst].
	RecentDirs addLast: _gsSqueakTemp_full