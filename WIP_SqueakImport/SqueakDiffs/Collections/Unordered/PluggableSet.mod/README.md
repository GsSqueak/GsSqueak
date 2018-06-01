PluggableSets allow the redefinition of hashing and equality by clients. This is in particular useful if the clients know about specific properties of the objects stored in the set which in turn can heavily improve the performance of sets and dictionaries.

Instance variables:
	hashBlock	<BlockClosure>	A one argument block used for hashing the elements.
	equalBlock	<BlockClosure>	A two argument block used for comparing the elements.

Example: Adding 1000000 integer points in the range (0@0) to: (100@100) to a set.

(	| n rnd set max points |
	set := Set new: (n := 1000000).
	rnd := Random new.
	max := 100.
	points := (1 to: n) collect: [:ign| (rnd next @ rnd next * max) truncated].
	Smalltalk garbageCollectMost. "to reduce variability in the run-to-run times"
	[1 to: 1000000 do: [:i| set add: (points at: i)]]
		timeToRun
)

The above is way slow since the default hashing function of points leads to an awful lot of collisions in the set. And now the same, with a somewhat different hash function:

(	| n rnd set max points |
	set := PluggableSet new: (n := 1000000).
	set hashBlock: [:item| (item x bitShift: 10) + item y].
	rnd := Random new.
	max := 100.
	points := (1 to: n) collect: [:ign| (rnd next @ rnd next * max) truncated].
	Smalltalk garbageCollectMost. "to reduce variability in the run-to-run times"
	[1 to: 1000000 do: [:i| set add: (points at: i)]]
		timeToRun
)