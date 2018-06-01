fileIn/Out
checkForAnyAlienAuthorship
	"Check to see if there are any versions of any methods in the receiver that have author initials other than that of the current author, and open a browser on all found"
	| aList initials |
	(initials := Utilities authorInitials) isEmptyOrNil ifTrue: [ ^self inform: 'No author initials set in this image' ].
	(aList := self methodsWithAnyInitialsOtherThan: initials) size > 0
		ifTrue:
			[ self systemNavigation
				browseMessageList: aList
				name: 'methods in "' , self name , '" with any authoring stamps not starting with "' , initials , '"' ]
		ifFalse: [ ^self inform: 'All versions of all methods in "' , self name , '"
have authoring stamps which start with "' , initials , '"' ]