dropping/grabbing
slideToTrash: evt
	self delete.
	"selectedItems do: [:m | m slideToTrash: evt]"