accessing
buildAllContours
	"Build the contours in all non-composite glyphs."
	glyphs do:[:assoc| assoc value buildAllContours].