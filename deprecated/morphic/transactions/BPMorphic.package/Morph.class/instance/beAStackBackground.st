-Etoys-card in a stack
beAStackBackground
	"Transform the receiver into one that has stack-background behavior.
	If just becoming a stack, allocate a uniclass to represent the cards (if
	one does not already exist"
	self assuredCardPlayer assureUniClass.
	self setProperty: #tabAmongFields toValue: true.
	self setProperty: #stackBackground toValue: true.
	"put my submorphs onto the background"
	submorphs
		do: [:mm | mm setProperty: #shared toValue: true].
	self reassessBackgroundShape