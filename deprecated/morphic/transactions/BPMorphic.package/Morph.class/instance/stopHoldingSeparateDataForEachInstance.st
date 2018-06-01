-Etoys-card in a stack
stopHoldingSeparateDataForEachInstance
	"Make the receiver no longer hold separate data for each instance"
	self removeProperty: #holdsSeparateDataForEachInstance.
	self stack reassessBackgroundShape