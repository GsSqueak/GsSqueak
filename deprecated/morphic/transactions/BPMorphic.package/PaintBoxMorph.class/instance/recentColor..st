recent colors
recentColor: aColor 
	"Remember the color as one of our recent colors"
	(recentColors
			anySatisfy: [:any | any color = aColor])
		ifTrue: [^ self].
	"already remembered"
	recentColors size
		to: 2
		by: -1
		do: [:i | 
			(recentColors at: i)
				color: (recentColors at: i - 1) color.
			RecentColors
				at: i
				put: (RecentColors at: i - 1)].
	recentColors first color: aColor.
	RecentColors at: 1 put: aColor