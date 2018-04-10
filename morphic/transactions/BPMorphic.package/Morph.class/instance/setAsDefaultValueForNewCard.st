-Etoys-card in a stack
setAsDefaultValueForNewCard
	"Set the receiver's current value as the one to be used to supply the
	default value for a variable on a new card. This implementation does
	not support multiple variables per morph, which is problematical"
	self setProperty: #defaultValue toValue: self currentDataValue deepCopy