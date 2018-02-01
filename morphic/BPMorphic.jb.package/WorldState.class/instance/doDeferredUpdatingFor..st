update cycle
doDeferredUpdatingFor: aWorld
  "If this platform supports deferred updates, then make my canvas be
	the Display (or a rectangular portion of it), set the Display to deferred
	update mode, and answer true. Otherwise, do nothing and answer
	false. One can set the class variable DisableDeferredUpdates to true to
	completely disable the deferred updating feature."

  | properDisplay |
  PasteUpMorph disableDeferredUpdates
    ifTrue: [ ^ false ].
<<<<<<< HEAD
  (Display deferUpdates: true) ifNil: [ ^ false ].	"deferred updates not supported"
=======
  ((Smalltalk at: #'Display') deferUpdates: true) ifNil: [ ^ false ].	"deferred updates not supported"
>>>>>>> 86cf22511f03aabffa314974130a17d983e10e09
  remoteServer
    ifNotNil: [ 
      self assuredCanvas.
      ^ true ].
  properDisplay := canvas notNil and: [ canvas form == Display ].
  aWorld == World
    ifTrue: [ 
      "this world fills the entire Display"
      properDisplay
        ifFalse: [ 
          aWorld viewBox: Display boundingBox.	"do first since it may clear canvas"
          self canvas: (Display getCanvas copyClipRect: Display boundingBox) ] ].
  ^ true