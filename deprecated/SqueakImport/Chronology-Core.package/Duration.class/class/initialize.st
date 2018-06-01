initialize-release
initialize
	ChronologyConstants classPool
		at: #Zero
		put:
			(self basicNew
				seconds: 0
				nanoSeconds: 0) ;
		at: #OneDay
		put: 1 day