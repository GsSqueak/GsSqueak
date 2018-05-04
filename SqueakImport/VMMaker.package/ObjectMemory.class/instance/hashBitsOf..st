header access
hashBitsOf: oop

	^ ((self baseHeader: oop) >> 17) bitAnd: 16rFFF