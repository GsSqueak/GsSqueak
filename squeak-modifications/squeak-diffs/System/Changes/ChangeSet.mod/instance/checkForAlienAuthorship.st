fileIn/Out
checkForAlienAuthorship
	"Check to see if there are any methods in the receiver that have author initials other than that of the current author, and open a browser on all found"
	| aList initials |
	(initials := Utilities authorInitials) isEmptyOrNil ifTrue: [ ^self inform: 'No author initials set in this image' ].
	(aList := self methodsWithInitialsOtherThan: initials) size > 0
		ifTrue:
			[ self systemNavigation
				browseMessageList: aList
				name: 'methods in "' , self name , '" whose authoring stamps do not start with "' , initials , '"' ]
		ifFalse: [ ^self inform: 'All methods in "' , self name , '"
have authoring stamps which start with "' , initials , '"' ]