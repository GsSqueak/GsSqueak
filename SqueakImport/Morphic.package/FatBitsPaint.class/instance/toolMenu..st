events
toolMenu: evt
	| menu |
	menu := MenuMorph new.
	menu
		addTitle: 'Tools';
		addStayUpItem.
	{
		{'paint brush'. self toolsForPaintBrush}.
		{'selections'. self toolsForSelection}
	} do: [:each |
		menu add: each first
			target: self
			selector: #setCurrentToolTo:
			argumentList: {each second}].
	menu toggleStayUp: evt.
	menu popUpEvent: evt in: self world