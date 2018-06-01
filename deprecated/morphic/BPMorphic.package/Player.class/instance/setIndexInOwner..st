slot getters/setters
setIndexInOwner: amt 
	"Move my costume to a different z-position within its container. This is
	primarily in service of auto-line-layout views in which the z-ordering
	determines the left/right and top/bottom placement."
	costume setIndexInOwner: amt