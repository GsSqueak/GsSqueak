events-processing
transformedFrom: uberMorph
  "Return a transform to map coordinates of uberMorph, a morph above
	me in my owner chain, into the coordinates of MYSELF not any of my
	children. "

  self flag: #'arNote'.	"rename this method"
  self owner ifNil: [ ^ IdentityTransform new ].
  ^ self owner transformFrom: uberMorph