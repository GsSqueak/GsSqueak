I am a Master Parts Bin that allows the user to drag out a new Morph from a voluminous iconic list.

Choose "objects" from the world menu, or type Alt-o (Cmd-o on the Mac).

To add a new kinds of Morphs:
In the class of the Morph, implement the message:

descriptionForPartsBin
	^ self partName:	'Rectangle'
		categories:		#('Graphics' ' Basic 1 ')
		documentation:	'A rectangular shape, with border and fill style'

The partName is the title that will show in the lower pane of the Object Tool.
When is categories mode, an object can be seen in more than one category.  The list above tells which ones.
Documentation is what will show in the balloon help for each object thumbnail.
The message #initializeToStandAlone creates the actual instance.

To make a second variant object prototype coming from the same class, implement #supplementaryPartsDescriptions.  In it, you get to specify the nativitySelector.  It is sent to the class to get the variant objects.  Often it is #authoringPrototype.  (A class may supply supplementaryPartsDescriptions without implementing descriptionForPartsBin.  This gives you better control.)

