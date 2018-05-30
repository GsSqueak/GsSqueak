docking bars support
createOrUpdateMainDockingBar
	"Private - create a new main docking bar or update the current one"
	| w mainDockingBars |
	w := self world.
	mainDockingBars := w mainDockingBars.
	mainDockingBars isEmpty ifTrue:
		[ "no docking bar, just create a new one"
		self dockingBar createDockingBar
			 openInWorld: w .
		^ self ].
	"update if needed"
	mainDockingBars do:
		[ : each | self dockingBar updateIfNeeded: each ]