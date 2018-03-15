emulating
do: aBlock 
	"Evaluate aBlock for each of the receiver's values."
	self valuesDo: aBlock