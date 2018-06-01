menu
chooseSound: evt
	| menu |
	menu := MenuMorph new.
	menu add: 'new...' target: self selector: #editNewSound.
	menu addLine.
	AbstractSound soundNames do:
		[:name |
		menu add: name
			target: self selector: #editSoundNamed:
			argument: name].
	menu popUpEvent: evt in: self world