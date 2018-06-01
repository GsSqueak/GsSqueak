start & finish
setRotations: num
	"Tell the palette what number of rotations (or background) to show.  "

	| key |
	key := 'ItTurns'.	"default and value for num > 1"
	num = 1 ifTrue: [key := 'JustAsIs'].
	num = 18 ifTrue: [key := 'ItTurns'].
	num = 99 ifTrue: [key := 'ToAndFro'].
	num == #Background ifTrue: [key := 'Background'].
	num == #Repeated ifTrue: [key := 'Repeated'].
	palette setRotations: (palette contentsAtKey: key).