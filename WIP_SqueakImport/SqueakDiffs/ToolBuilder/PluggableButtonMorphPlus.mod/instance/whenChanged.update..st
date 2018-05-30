updating
whenChanged: notification update: target
	"On receipt of a notification, such as #contents notification from a CodeHolder,
	invoke an update as if target had been the original notification."

	self updateMap at: notification put: target