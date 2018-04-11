copying
veryDeepFixupWith: deepCopier
  "If some fields  variable has already been declared->were weakly copied, fix new copy here."

  "super veryDeepFixupWith: deepCopier.	Object has no fixups, so don't
	call it"

  "If my owner is being duplicated too, then store his duplicate.
	If I am owned outside the duplicated tree, then I am no longer
	owned! "

  self privateOwner: deepCopier references at: self owner ifAbsent: [  ]