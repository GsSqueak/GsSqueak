I am used to build menus on-the-fly. I maintain lists of menu items, actions (usually symbols to be sent as messages), and menu section dividing lines to which my clients may append new entries and lines by sending me the messages:

	add: aString action: anAction
	addLine

After the menu is constructed, it may be invoked with one of the following messages:

	startUp: initialSelection
	startUp

I am a subclass of ActionMenu, so I inherit a number of instance variables. The ones I am particularly concerned with are:

	items := an OrderedCollection of strings to appear in the menu
	selectors := an OrderedCollection of Symbols to be used as message selectors
	lineArray := an OrderedCollection of line positions
	lastLine := used to keep track of the last line to avoid making duplicate entries in lineArray