I am a place-holder for information needed by the Debugger to inspect method activations.  See my superclass's comment. I map methods compiled using closures.

Instance variables
	blockExtentsToTempsRefs <Dictionary of: Interval -> Array of: (Array with: String with: (Integer | (Array with: Integer with: Integer)))>
		maps a block extent to an Array of temp references for that block/method.
		Each reference is a pair of temp name and index, where the index can itself be a pair for a remote temp.
	startKeysToTempRefs <Dictionary of: Integer startpc -> Array of: (Array with: String with: temp reference)> where
		temp reference ::= Integer
							| (Array with: Integer with: Integer)
							| (Array with: #outer with: temp reference)