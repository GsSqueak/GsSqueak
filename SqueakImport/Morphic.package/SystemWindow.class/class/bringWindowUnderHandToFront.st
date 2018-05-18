top window
bringWindowUnderHandToFront
"This only works when All Windows Active is enabled."
	(self windowsIn: Project current world) do: [ : each | each isLookingFocused ifTrue: [ ^ each beKeyWindow ]]