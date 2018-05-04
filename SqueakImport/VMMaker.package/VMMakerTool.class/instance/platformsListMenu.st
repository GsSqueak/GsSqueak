menus
platformsListMenu
	"create a menu of all known platforms"

	| choice platnames |
	platnames := vmMaker platformRootDirectory directoryNames 
				copyWithoutAll: #('Cross' 'CVS' '.svn').
	choice := (PopUpMenu labelArray: platnames
				lines: #()) startUp.
	choice = 0 ifTrue: [^self].
	self platformNameText: (platnames at: choice) asText