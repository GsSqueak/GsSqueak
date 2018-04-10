support windows
openStandardWorkspace
	"Open up a throwaway workspace with useful expressions in it.
	1/22/96 sw"
	"Utilities openStandardWorkspace"
	(StringHolder new contents: self standardWorkspaceContents)
		openLabel: 'Useful Expressions ' , Date today printString