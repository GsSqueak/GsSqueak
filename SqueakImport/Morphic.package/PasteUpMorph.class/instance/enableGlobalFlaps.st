flaps
enableGlobalFlaps 
	"Restore saved global flaps, or obtain brand-new system defaults if necessary"

	Flaps globalFlapTabs. 		 "If nil, creates new ones"
	self addGlobalFlaps 			 "put them on screen"