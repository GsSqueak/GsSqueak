samples
example1
	" 
	DockingBarMorph example1.  
	 
	(Color lightBlue wheel: 4) do:[:c | DockingBarMorph example1 
	color: c; borderColor: c twiceDarker]. 
	 
	Project current world deleteDockingBars.
	"
	| instance |
	instance := DockingBarMorph new.
	""
	instance addSpace: 10.
	instance
		addMorphBack: (ClockMorph new show24hr: true).
	instance addSpacer.
	instance
		addMorphBack: (ClockMorph new show24hr: true).
	instance addSpace: 10.
	""
	instance adhereToTop.
	""
	instance autoGradient: true.
	instance layoutInset: 10.
	""
	^ instance openInWorld