file in/out
storeSomeSegment
	"Try all projects to see if any is ready to go out.  Send at most three of them.
	Previous one has to wait for a garbage collection before it can go out."

	| cnt pList start proj gain |
	cnt := 0.
	gain := 0.
	pList := Project allProjects.
	start := pList size atRandom.	"start in a random place"
	start to: pList size + start
		do: 
			[:ii | 
			proj := pList atWrap: ii.
			proj storeSegment 
				ifTrue: 
					["Yes, did send its morphs to the disk"

					gain := gain + (proj projectParameters at: #segmentSize ifAbsent: [0]).	"a guess"
					Beeper beep.
					(cnt := cnt + 1) >= 2 ifTrue: [^gain]]].
	Beeper  beep.
	^gain