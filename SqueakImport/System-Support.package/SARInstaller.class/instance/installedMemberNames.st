accessing
installedMemberNames
	"Answer the names of the zip members that have been installed already."
	^self installedMembers collect: [ :ea | ea fileName ]