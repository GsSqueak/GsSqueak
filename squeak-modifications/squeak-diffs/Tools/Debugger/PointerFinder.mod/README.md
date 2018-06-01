I can search for reasons why a certain object isn't garbage collected.  I'm a quick port of a VisualWorks program written by Hans-Martin Mosner.  Call me as shown below.  I'll search for a path from a global variable to the given object, presenting it in a small morphic UI.

Examples:
	PointerFinder on: self currentHand
	PointerFinder on: StandardSystemView someInstance

Now, let's see why this image contains more HandMorphs as expected...

HandMorph allInstancesDo: [:e | PointerFinder on: e]