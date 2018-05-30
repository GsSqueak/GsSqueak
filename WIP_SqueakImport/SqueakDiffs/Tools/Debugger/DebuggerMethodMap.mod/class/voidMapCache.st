class initialization
voidMapCache

	self protected: [ 
		MapCache := WeakIdentityKeyDictionary new.
		MapCacheEntries := 16 ]