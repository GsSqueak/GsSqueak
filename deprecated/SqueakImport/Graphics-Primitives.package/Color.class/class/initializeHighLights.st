class initialization
initializeHighLights
	"Create a set of Bitmaps for quickly reversing areas of the screen without converting colors. "
	"Color initializeHighLights"

	| t |
	t := Array new: 32.
	t at: 1 put: (Bitmap with: 16rFFFFFFFF).
	t at: 2 put: (Bitmap with: 16rFFFFFFFF).
	t at: 4 put: (Bitmap with: 16r55555555).
	t at: 8 put: (Bitmap with: 16r7070707).
	t at: 16 put: (Bitmap with: 16rFFFFFFFF).
	t at: 32 put: (Bitmap with: 16rFFFFFFFF).
	HighLightBitmaps := t.
