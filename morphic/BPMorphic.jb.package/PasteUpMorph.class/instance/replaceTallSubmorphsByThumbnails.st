options
replaceTallSubmorphsByThumbnails
	"Any submorphs that seem to tall get replaced by thumbnails; their
	balloon text is copied over to the thumbnail"
	| heightForThumbnails maxHeightToAvoidThumbnailing maxWidthForThumbnails |
	heightForThumbnails := self heightForThumbnails.
	maxHeightToAvoidThumbnailing := self maxHeightToAvoidThumbnailing.
	maxWidthForThumbnails := self maximumThumbnailWidth.
	self submorphs
		do: [:aMorph | 
			| existingHelp itsThumbnail |
			itsThumbnail := aMorph
						representativeNoTallerThan: maxHeightToAvoidThumbnailing
						norWiderThan: maxWidthForThumbnails
						thumbnailHeight: heightForThumbnails.
			aMorph == itsThumbnail
				ifFalse: [existingHelp := aMorph balloonText.
					self replaceSubmorph: aMorph by: itsThumbnail.
					existingHelp
						ifNotNil: [itsThumbnail setBalloonText: existingHelp]]]