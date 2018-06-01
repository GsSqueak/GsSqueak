instance creation
addDullerScrollables: theme
	"self createDuller apply"
	
	theme
		set: #filterColor for: #PluggableListMorph to: Color yellow paler duller.