instance creation
initializedInstance
	"Answer an instance of the receiver which in some sense is initialized.  In the case of Morphs, this will yield an instance that can be attached to the Hand after having received the same kind of basic initialization that would be obtained from an instance chosen from the 'new morph' menu.   Return nil if the receiver is reluctant for some reason to return such a thing"

	^ self new
