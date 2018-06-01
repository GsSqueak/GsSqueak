menu
invokeNoteMenu: evt
	"Invoke the note's edit menu."

	| menu |
	menu := MenuMorph new defaultTarget: self.
	menu addList:
		#(('grid to next quarter'		gridToNextQuarter)
		('grid to prev quarter'		gridToPrevQuarter)).

	menu popUpEvent: evt in: self world.
