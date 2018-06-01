menu
addTwinkleMenuItems: aCustomMenu hand: aHandMorph 
	"Menu items to change the sharpness of the star."
	aCustomMenu addLine.
	aCustomMenu add: 'twinkle fatter' translated action: #nextTwinkle.
	aCustomMenu add: 'twinkle thinner' translated action: #prevTwinkle.
"	aCustomMenu add: 'fatter star' translated action: #nextFatter.
	aCustomMenu add: 'thinner star' translated action: #prevThinner"
	
	


