server list
removeServer

	| choice names |
	self flag: #ViolateNonReferenceToOtherClasses.
	names := ServerDirectory serverNames.
	choice := UIManager default chooseFrom: names values: names.
	choice == nil ifTrue: [^ self].
	ServerDirectory removeServerNamed: choice