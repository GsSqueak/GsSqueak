accessing
color: newColor

	| buttonColor |

	super color: newColor.
	buttonColor := color darker.
	self submorphsDo: [:m | m submorphsDo: [:n | n color: buttonColor]]