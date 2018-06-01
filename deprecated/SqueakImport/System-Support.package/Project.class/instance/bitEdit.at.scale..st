editors
bitEdit: aForm at: magnifiedFormLocation scale: scaleFactor 
	"Create and schedule a view whose top left corner is magnifiedLocation 
	and that contains a view of aForm magnified by scaleFactor that  can be
	modified using the Bit Editor. It also contains a view of the original form."

	self subclassResponsibility