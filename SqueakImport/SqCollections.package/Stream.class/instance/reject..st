enumerating
reject: aBlock

	^ self select: [:element | (aBlock value: element) == false]