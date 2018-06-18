font creation
installDejaVu
	"You have to re-create UI themes after doing this.
	StrikeFont installDejaVu
	
	Only create one size as we are missing longer methods in GsSqueak
	"

	TextConstants
		at: 'Bitmap DejaVu Sans' 
		put: (TextStyle fontArray: (#(12) collect: [:size | self createDejaVu: size])).

