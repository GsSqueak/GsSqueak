private
fromReader: reader

	images := reader forms.
	delays := reader delays.
	self isOpaque: true.
	self reset.