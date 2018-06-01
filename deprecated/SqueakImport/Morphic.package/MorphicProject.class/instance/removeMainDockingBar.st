docking bars support
removeMainDockingBar
	"Remove the receiver's main docking bars"
	self world mainDockingBars
		do: [:each | each delete]