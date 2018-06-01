change reporting
invalidate: box1 areasOutside: box2

	((box1 intersect: bounds) areasOutside: (box2 intersect: bounds))
		do: [:r | self invalidRect: r]