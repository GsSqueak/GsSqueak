recent colors
recentColor: aColor 
	"Remember the color as one of our recent colors"
	Prototype currentColor: aColor.
	(recentColors anySatisfy: [:any | any color = aColor])
		ifTrue: [^self].	"already remembered"
	RecentColors := {aColor}, RecentColors allButLast.
	RecentColors keysAndValuesDo: [:i :each |
		(recentColors at: i) color: each]