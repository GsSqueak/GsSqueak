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
  ((SessionTemps current at: #'Display') deferUpdates: true) ifNil: [ ^ false ].	"deferred updates not supported"
  remoteServer
    ifNotNil: [ 
      self assuredCanvas.
      ^ true ].
  properDisplay := canvas notNil
    and: [ canvas form == (SessionTemps current at: #'Display') ].
  aWorld == (SessionTemps current at: #'World')
    ifTrue: [ 
      "this world fills the entire Display"
      properDisplay
        ifFalse: [ 
          aWorld viewBox: (SessionTemps current at: #'Display') boundingBox.	"do first since it may clear canvas"
          self
            canvas:
              ((SessionTemps current at: #'Display') getCanvas
                copyClipRect: (SessionTemps current at: #'Display') boundingBox) ] ].
  ^ true