layout
updateMinimumExtent
	"This grows only. For shrinking scroll bars, this might have to be
	changed. "
	self
		minimumWidth: (self minimumWidth max: self minScrollbarWidth).
	self
		minimumHeight: (self minimumHeight max: self minScrollbarHeight)