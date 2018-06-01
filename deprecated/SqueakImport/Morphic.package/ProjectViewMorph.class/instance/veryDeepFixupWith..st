copying
veryDeepFixupWith: deepCopier
	"If target and arguments fields were weakly copied, fix them here.  If they were in the tree being copied, fix them up, otherwise point to the originals!!"

super veryDeepFixupWith: deepCopier.
project := deepCopier references at: project ifAbsent: [project].
lastProjectThumbnail := deepCopier references at: lastProjectThumbnail 
				ifAbsent: [lastProjectThumbnail].
