private
initialize: size

	contentsArray := Array new: size.
	readPosition := 1.
	writePosition := 1.
	accessProtect := Semaphore forMutualExclusion.
	readSynch := Semaphore new