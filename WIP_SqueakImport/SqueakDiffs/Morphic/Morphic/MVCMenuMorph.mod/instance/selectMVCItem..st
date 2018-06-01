private
selectMVCItem: item
	"Called by the MenuItemMorph that the user selects.
	Record the selection and set the done flag to end this interaction."

	mvcSelection := item.
	done := true.
