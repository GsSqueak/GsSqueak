examples
example
	"
	AtomMorph example
	"
	|a world|
	world := Project current world.
	a := AtomMorph new openInWorld. 
	a color: Color random.
 	[1000 timesRepeat:  [a bounceIn: world bounds.  (Delay forMilliseconds: 50) wait]. 
	 a delete] fork.