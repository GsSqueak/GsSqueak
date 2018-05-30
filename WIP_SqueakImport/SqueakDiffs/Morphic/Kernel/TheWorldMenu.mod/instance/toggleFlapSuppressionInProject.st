*Morphic-MorphicExtras-action
toggleFlapSuppressionInProject
	"Toggle whether global flaps are suppressed in this project.  Obsolete, retained for bkwrd compatibility with preexisting persistent menus."

	self flag: #toRemove.
	self inform: 'This is an obsolete menu -- please delete it'