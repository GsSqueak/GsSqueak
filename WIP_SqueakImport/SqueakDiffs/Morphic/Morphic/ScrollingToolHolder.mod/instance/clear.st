accessing
clear
	"wipe out all existing stamps"

	stamps := OrderedCollection new: 16.
	thumbnailPics := OrderedCollection new: 16.
	stampButtons do: [:each | 
		stamps addLast: nil.	"hold a space"
		thumbnailPics addLast: nil].
	start := 1.
	self normalize.