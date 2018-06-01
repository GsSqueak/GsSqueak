font creation
installDejaVuDark
	" This is a Version of dejaVu renderd for light text on dark background. You have to re-create UI themes after doing this.
	StrikeFont installDejaVuDark
	"

	TextConstants
		at: 'Darkmap DejaVu Sans' 
		put: (TextStyle fontArray: (#(7 9 12 14 17 20) collect: [:size | self createDejaVuDark: size])).
