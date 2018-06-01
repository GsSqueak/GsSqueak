-Etoys-card in a stack
makeHoldSeparateDataForEachInstance
	"Mark the receiver as holding separate data for each instance (i.e., like
	a 'background field') and reassess the shape of the corresponding
	background so that it will be able to accommodate this arrangement."
	self setProperty: #holdsSeparateDataForEachInstance toValue: true.
	self stack reassessBackgroundShape