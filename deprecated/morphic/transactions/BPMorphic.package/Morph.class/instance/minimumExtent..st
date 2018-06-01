geometry
minimumExtent: aPoint 
	"Do not shrink below this extent."
	self minWidth: aPoint x;
		 minHeight: aPoint y