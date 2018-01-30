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
  ((Smalltalk at: #'Display') deferUpdates: true) ifNil: [ ^ false ].	"deferred updates not supported"
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