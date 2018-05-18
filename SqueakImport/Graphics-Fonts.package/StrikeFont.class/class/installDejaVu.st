font creation
installDejaVu
	"You have to re-create UI themes after doing this.
	StrikeFont installDejaVu
	"

	TextConstants
		at: 'Bitmap DejaVu Sans' 
		put: (TextStyle fontArray: (#(7 9 12 14 17 20) collect: [:size | self createDejaVu: size])).
