samples
squeakMenu
	| menu |
	menu := DockingBarMenuMorph new defaultTarget: self.
	menu
		add: 'Hello'
		target: self
		selector: #inform:
		argument: 'Hello World!'.
	menu
		add: 'Long Hello'
		target: self
		selector: #inform:
		argument: 'Helloooo World!'.
	menu
		add: 'A very long Hello'
		target: self
		selector: #inform:
		argument: 'Hellooooooooooooooo World!'.
	menu
		add: 'An incredible long Hello'
		target: self
		selector: #inform:
		argument: 'Hellooooooooooooooooooooooo World!'.
	^ menu