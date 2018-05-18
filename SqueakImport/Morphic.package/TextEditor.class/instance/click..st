events
click: evt
	"This is called if you click in a text selection while drag is enabled, but you did not drag. Also see #startDrag:."
	
	self selectAt: (paragraph characterBlockAtPoint: evt position) stringIndex.