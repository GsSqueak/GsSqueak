initialize
providedPlugins
	"generate the list by asking the InterpreterPlugins"
	^ ((InterpreterPlugin allSubclasses
		select: [:cl | cl shouldBeTranslated])
		collect: [:cl | cl name]) asSortedCollection