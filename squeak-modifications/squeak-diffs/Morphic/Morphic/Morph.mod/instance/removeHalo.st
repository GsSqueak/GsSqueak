halos and balloon help
removeHalo
	"remove the surrounding halo (if any)"

	self halo ifNotNil: [ self primaryHand removeHalo ]