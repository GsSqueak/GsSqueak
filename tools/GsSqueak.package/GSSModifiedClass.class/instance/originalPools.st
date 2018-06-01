accessing - real class
originalPools

	^ self realClass sharedPools collect: [:pool | self environment keyAtIdentityValue: pool] as: Array