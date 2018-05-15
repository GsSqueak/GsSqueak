accessing
uninstalledMemberNames
	"Answer the names of the zip members that have not yet been installed."
	^self uninstalledMembers collect: [ :ea | ea fileName ]