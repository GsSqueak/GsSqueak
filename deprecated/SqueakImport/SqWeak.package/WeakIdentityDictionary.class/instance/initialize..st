private
initialize: n
	vacuum := Object new.
	array := self class arrayType new: n withAll: vacuum.
	tally := 0