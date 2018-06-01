events-processing
keyStroke: evt 

	| asc |
	asc := evt keyCharacter asciiValue.
	asc = 27 ifTrue: [ "escape key" 
		^self deactivate: evt ].
	asc = self selectSubmenuKey ifTrue: [
		self ensureSelectedItem: evt.
		self selectedItem subMenu ifNotNil: [ :subMenu |
			subMenu items ifNotEmpty: [
				subMenu activate: evt.
				^subMenu moveSelectionDown: 1 event: evt ] ] ].
	asc = self previousKey ifTrue: [ ^self moveSelectionDown: -1 event: evt ].
	asc = self nextKey ifTrue: [ ^self moveSelectionDown: 1 event: evt ].
	selectedItem ifNotNil: [ 
		selectedItem subMenu ifNotNil: [ :subMenu |
			" If we didn't handle the keystroke, pass the keyboard focus 
			to the open submenu. "
			evt hand newKeyboardFocus: subMenu.
			subMenu keyStroke: evt ] ]