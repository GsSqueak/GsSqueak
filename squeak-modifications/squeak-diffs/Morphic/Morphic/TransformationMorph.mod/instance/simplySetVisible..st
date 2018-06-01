geometry eToy
simplySetVisible: aBoolean
	"Set the receiver's visibility property.  This mild circumlocution is because my own #visible: method would also set the visibility flag of my flexee, which in this case is pointless because it's the flexee that calls this."

	super visible: aBoolean