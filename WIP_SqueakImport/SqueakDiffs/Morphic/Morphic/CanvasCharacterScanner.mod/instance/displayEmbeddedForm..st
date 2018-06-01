displaying
displayEmbeddedForm: aForm
	canvas
		drawImage: aForm
		at: destX @ (lineY + line baseline - aForm height)