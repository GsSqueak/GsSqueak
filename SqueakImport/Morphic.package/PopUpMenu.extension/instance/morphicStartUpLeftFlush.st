*Morphic-Menus
morphicStartUpLeftFlush
	"Build and invoke this menu with no initial selection.  By Jerry Archibald, 4/01.
	If in MVC, align menus items with the left margin.
	Answer the selection associated with the menu item chosen by the user or nil if none is chosen.  
	The mechanism for getting left-flush appearance in mvc leaves a tiny possibility for misadventure: if the user, in mvc, puts up the jump-to-project menu, then hits cmd period while it is up, then puts up a second jump-to-project menu before dismissing or proceeding through the debugger, it's possible for mvc popup-menus thereafter to appear left-aligned rather than centered; this very unlikely condition can be cleared by evaluating 'PopUpMenu alignment: 2'"

	^self startUp