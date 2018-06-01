instance creation
fromColorref: aColorref 
	| red green blue |
	red := aColorref bitAnd: 16rFF.
	green := (aColorref bitAnd: 16rFF00)
				>> 8.
	blue := (aColorref bitAnd: 16rFF0000)
				>> 16.
	^ self r: red g: green b: blue range: 255.