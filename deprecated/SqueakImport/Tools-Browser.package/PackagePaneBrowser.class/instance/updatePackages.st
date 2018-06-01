package list
updatePackages
	"Update the contents of the package list."

	self editSelection: #none.
	self changed: #packageList.
	self changed: #package.
	self packageListIndex: 0 