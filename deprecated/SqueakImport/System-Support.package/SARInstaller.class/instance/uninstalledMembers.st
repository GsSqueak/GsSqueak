accessing
uninstalledMembers
	"Answer the zip members that haven't been installed or extracted yet."
	^zip members copyWithoutAll: self installedMembers