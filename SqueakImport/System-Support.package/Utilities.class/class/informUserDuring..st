user interface
informUserDuring: aBlock
	"Display a message above (or below if insufficient room) the cursor during execution of the given block. This is now handled by UIManager."
	"Utilities informUserDuring:[:bar|
		#(one two three) do:[:info|
			bar value: info.
			(Delay forSeconds: 1) wait]]"
	^UIManager default informUserDuring: aBlock