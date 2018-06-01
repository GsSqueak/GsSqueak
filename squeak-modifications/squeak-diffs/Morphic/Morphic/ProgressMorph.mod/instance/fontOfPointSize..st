private
fontOfPointSize: size
	^ (TextConstants at: Preferences standardEToysFont familyName ifAbsent: [TextStyle default]) fontOfPointSize: size