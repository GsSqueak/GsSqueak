construction
buildWorldMenu
	"Build the menu that is put up when the screen-desktop is clicked on"
	| menu |
	menu := MenuMorph new defaultTarget: self.
	menu commandKeyHandler: self.
	self colorForDebugging: menu.
	menu addStayUpItem.
	self makeConvenient: menu.
	Smalltalk at: #ServiceGUI ifPresent:[:sgui|
		sgui worldMenu: menu.
		sgui onlyServices ifTrue: [^ menu].
	].
	self addProjectEntries: menu.
	myWorld addUndoItemsTo: menu.
	self addRestoreDisplay: menu.
	self addUtilities: menu.
	self addObjectsAndTools: menu.
	self addPrintAndDebug: menu.
	self addSaveAndQuit: menu.
	^ menu