initialization
duplicate: newGuy from: oldGuy 
	"oldGuy has just been duplicated and will stay in this world. Make sure
	all the MorphicModel requirements are carried out for the copy. Ask
	user to rename it. "
	newGuy installModelIn: oldGuy world.
	newGuy copySlotMethodsFrom: oldGuy slotName