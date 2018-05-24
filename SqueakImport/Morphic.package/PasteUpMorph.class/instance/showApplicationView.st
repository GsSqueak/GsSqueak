menu & halo
showApplicationView

	self transformToShow: (self valueOfProperty: #applicationViewBounds ifAbsent: [bounds])
		