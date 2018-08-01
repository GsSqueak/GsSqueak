accessing
gemNRS

	^ '!tcp@localhost#netldi:{1}_ldi#task!gemnetobject' format: {
		self stoneName}