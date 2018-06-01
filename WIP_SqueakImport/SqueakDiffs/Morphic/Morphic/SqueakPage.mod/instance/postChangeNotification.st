private
postChangeNotification
	"Inform all thumbnails and books that this page has been updated."

	URLMorph allSubInstancesDo: [:m | m pageHasChanged: self].
