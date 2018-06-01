initialization
initialize
	"Initialize the receiver, which was just created via a call to the  
	class's #basicNew"
	super initialize.
	""
	pageSize := self defaultPageSize.
	self removeEverything.
	
	tabsMorph := IndexTabs new.
	self addMorph: tabsMorph