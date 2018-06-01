private
reset

	imageIndex := 0.
	self image: (Form extent: images first extent depth: 32).
	self step.