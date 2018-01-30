world menu
invokeWorldMenu: evt 
	"Put up the world menu, triggered by the passed-in event. But don't
	do it if the eToyFriendly preference is set to true."
	Preferences eToyFriendly
		ifFalse: [self putUpWorldMenu: evt]