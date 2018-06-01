-Etoys-utilities
wordingForOperator: aString 
	"Answer the wording to be seen by the user for the given operator
	symbol/string "
	| _gsSqueakTemp_toTest |
	_gsSqueakTemp_toTest := aString asString.
	#(#(#append: 'include at end' ) #(#arrowheadsOnAllPens 'arrowheads on all pens' ) #(#beep: 'make sound' ) #(#bounce: 'bounce' ) #(#clearTurtleTrails 'clear pen trails' ) #(#clearOwnersPenTrails 'clear all pen trails' ) #(#colorSees 'color  sees' ) #(#color:sees: 'color sees' ) #(#doMenuItem: 'do menu item' ) #(#doScript: 'do' ) #(#forward: 'forward by' ) #(#goToRightOf: 'align after' ) #(#includeAtCursor: 'include at cursor' ) #(#isDivisibleBy: 'is divisible by' ) #(#liftAllPens 'lift all pens' ) #(#lowerAllPens 'lower all pens' ) #(#makeNewDrawingIn: 'start painting in' ) #(#max: 'max' ) #(#min: 'min' ) #(#moveToward: 'move toward' ) #(#noArrowheadsOnAllPens 'no arrowheads on pens' ) #(#overlapsAny 'overlaps any' ) #(#pauseAll: 'pause all' ) #(#pauseScript: 'pause script' ) #(#prepend: 'include at beginning' ) #(#seesColor: 'is over color' ) #(#startAll: 'start all' ) #(#startScript: 'start script' ) #(#stopProgramatically 'stop' ) #(#stopAll: 'stop all' ) #(#stopScript: 'stop script' ) #(#tellAllSiblings: 'tell all siblings' ) #(#tellSelfAndAllSiblings: 'send to all' ) #(#turn: 'turn by' ) #(#turnToward: 'turn toward' ) #(#wearCostumeOf: 'look like' ) )
		do: [:pair | _gsSqueakTemp_toTest = pair first
				ifTrue: [^ pair second]].
	^ _gsSqueakTemp_toTest"StandardScriptingSystem initialize"