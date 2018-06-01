other
collisionPairs
	"Return a list of pairs of colliding atoms, which are assumed to be
circles of known radius. This version uses the morph's positions--i.e.
the top-left of their bounds rectangles--rather than their centers."

	| count sortedAtoms radius twoRadii radiiSquared collisions p1 continue j p2 distSquared m1 m2 |
	count := submorphs size.
	sortedAtoms := submorphs 
				sorted: [:mt1 :mt2 | mt1 position x < mt2 position x].
	radius := 8.
	twoRadii := 2 * radius.
	radiiSquared := radius squared * 2.
	collisions := OrderedCollection new.
	1 to: count - 1
		do: 
			[:i | 
			m1 := sortedAtoms at: i.
			p1 := m1 position.
			continue := (j := i + 1) <= count.
			[continue] whileTrue: 
					[m2 := sortedAtoms at: j.
					p2 := m2 position.
					continue := p2 x - p1 x <= twoRadii  
								ifTrue: 
									[distSquared := (p1 x - p2 x) squared + (p1 y - p2 y) squared.
									distSquared < radiiSquared 
										ifTrue: [collisions add: (Array with: m1 with: m2)].
									(j := j + 1) <= count]
								ifFalse: [false]]].
	^collisions