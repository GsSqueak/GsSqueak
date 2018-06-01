actions & preps
render: damageRect
	"Compose the damaged area again and store on the display.  damageRect is relative to paintingForm origin.  3/19/97 tk"

	self invalidRect: damageRect.	"Now in same coords as self bounds"
