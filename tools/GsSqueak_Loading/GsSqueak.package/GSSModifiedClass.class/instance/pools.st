accessing
pools

	^ pools ifNil: [self realClass sharedPools collect: [:pool | self environment keyAtIdentityValue: pool]]