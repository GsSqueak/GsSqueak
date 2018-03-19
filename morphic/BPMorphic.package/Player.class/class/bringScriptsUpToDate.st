scripts
bringScriptsUpToDate
	"Bring all the receiver's scripts up to date, after, for example, a name
	change "
	self scripts
		do: [:aUniclassScript | aUniclassScript bringUpToDate]