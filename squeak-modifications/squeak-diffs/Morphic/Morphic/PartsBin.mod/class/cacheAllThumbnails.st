thumbnail cache
cacheAllThumbnails
	"In one monster operation, cache all the thumbnails of parts.  Intended to be called from do-its in update postscripts, for example, or manually."

	Cursor wait showWhile:
		[Morph withAllSubclasses do: [:aClass |
			(aClass class includesSelector: #descriptionForPartsBin) ifTrue:
				[self thumbnailForPartsDescription: aClass descriptionForPartsBin].
			(aClass class includesSelector: #supplementaryPartsDescriptions) ifTrue:
				[aClass supplementaryPartsDescriptions do:
					[:aDescription | self thumbnailForPartsDescription: aDescription]]]]

"Time millisecondsToRun: [PartsBin initialize. PartsBin cacheAllThumbnails]"
