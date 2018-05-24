events
mouseMove: evt
	" If the mouse moves over an item not selected, we try to set it as selected.
	If this happens depends on that the current selected item wants to release
	its selection. "

	self selectedItem ifNil: [
		self 
			selectItem: (
				self items 
					detect: [ :each | each containsPoint: evt position ] 
					ifNone: [ nil ])
			event: evt].

	"Transfer control to *either* the currently active submenu or the pop up owner, if any. Since the active sub menu is always displayed upfront check it first."	
	self selectedItem ifNotNil: [
		(self selectedItem activateSubmenu: evt) 
			ifTrue: [ ^self ]
			ifFalse: [ 
				(self containsPoint: evt position) ifFalse: [ 
					self selectItem: nil event: evt ] ] ].

	"Note: The following does not traverse upwards but it's the best I can do for now"
	popUpOwner ifNotNil:[(popUpOwner activateOwnerMenu: evt) ifTrue: [^ self]].
