class initialization
initializeHighLights
<<<<<<< HEAD
  "Create a set of Bitmaps for quickly reversing areas of the screen
	without converting colors."

  "Color initializeHighLights"

  | _gsSqueakTemp_t |
  _gsSqueakTemp_t := Array new: 32.
  _gsSqueakTemp_t at: 1 put: (MyBitmap with: 4294967295).
  _gsSqueakTemp_t at: 2 put: (MyBitmap with: 4294967295).
  _gsSqueakTemp_t at: 4 put: (MyBitmap with: 1431655765).
  _gsSqueakTemp_t at: 8 put: (MyBitmap with: 117901063).
  _gsSqueakTemp_t at: 16 put: (MyBitmap with: 4294967295).
  _gsSqueakTemp_t at: 32 put: (MyBitmap with: 4294967295).
  HighLightBitmaps := _gsSqueakTemp_t
=======
	"Create a set of Bitmaps for quickly reversing areas of the screen
	without converting colors."
	"Color initializeHighLights"
	| _gsSqueakTemp_t |
	_gsSqueakTemp_t := Array new: 32.
	_gsSqueakTemp_t
		at: 1
		put: (Bitmap with: 4294967295).
	_gsSqueakTemp_t
		at: 2
		put: (Bitmap with: 4294967295).
	_gsSqueakTemp_t
		at: 4
		put: (Bitmap with: 1431655765).
	_gsSqueakTemp_t
		at: 8
		put: (Bitmap with: 117901063).
	_gsSqueakTemp_t
		at: 16
		put: (Bitmap with: 4294967295).
	_gsSqueakTemp_t
		at: 32
		put: (Bitmap with: 4294967295).
	HighLightBitmaps := _gsSqueakTemp_t
>>>>>>> 86cf22511f03aabffa314974130a17d983e10e09
