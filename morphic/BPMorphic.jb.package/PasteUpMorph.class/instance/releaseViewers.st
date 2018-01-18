flaps
releaseViewers	"In preparation for saving, make the flapTabs release their viewers."	self flapTabs		do: [:ft | (ft respondsTo: #hibernate)				ifTrue: [ft hibernate]]