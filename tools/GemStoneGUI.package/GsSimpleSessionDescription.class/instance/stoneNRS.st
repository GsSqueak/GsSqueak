accessing
stoneNRS

	^ '!tcp@localhost#server!{1}' format: {
		self stoneName}