user interface
informUser: aString during: aBlock 
	"Display a message above (or below if insufficient room) the cursor
	during execution of the given block. This is now handled by
	UIManager. "
	"Utilities informUser: 'Just a sec!' during: [(Delay forSeconds: 1) wait]"
	^ UIManager default informUser: aString during: aBlock