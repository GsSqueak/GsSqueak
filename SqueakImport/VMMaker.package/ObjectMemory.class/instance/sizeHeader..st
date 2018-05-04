header access
sizeHeader: oop

	^ self longAt: oop - (self bytesPerWord * 2)