url
alreadyInFromUrl: aUrl
	"Does a bookMorph living in some world in this image represent the same set of server pages? If so, don't create another one.  It will steal pages from the existing one.  Go delete the first one."
	
	self withAllSubclassesDo: [:cls |
		cls allInstancesDo: [:aBook | 
			 (aBook valueOfProperty: #url) = aUrl ifTrue: [
				aBook world ifNotNil: [
					self inform: 'This book is already open in some project' translated.
					^ true]]]].
	^ false