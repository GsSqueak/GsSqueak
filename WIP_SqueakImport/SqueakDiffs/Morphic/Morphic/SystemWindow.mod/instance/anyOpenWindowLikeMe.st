open/close
anyOpenWindowLikeMe
	
	self class reuseWindows ifFalse: [ ^Array empty ].
	^ SystemWindow
		windowsIn: self world 
		satisfying: 
			[ : each |
			each model class = self model class
				and: [ (each model respondsTo: #representsSameBrowseeAs:) 
				and: [ each model representsSameBrowseeAs: self model ] ] ]
