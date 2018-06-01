drawing
drawOn: aCanvas
	"Clear the damageReported flag when redrawn."

	super drawOn: aCanvas.
	damageReported := false.