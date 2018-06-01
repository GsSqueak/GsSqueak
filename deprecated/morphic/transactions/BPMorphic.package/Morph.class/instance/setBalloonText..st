halos and balloon help
setBalloonText: stringOrText 
	"Set receiver's balloon help text. Pass nil to remove the help."
	self flag: #deprecated.
	"mt: Use #balloonText:."
	self balloonText: stringOrText