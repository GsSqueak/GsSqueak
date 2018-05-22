class initialization
cleanUp
	"Flush synthesized strike fonts"

	self allInstancesDo:[:sf| sf reset].