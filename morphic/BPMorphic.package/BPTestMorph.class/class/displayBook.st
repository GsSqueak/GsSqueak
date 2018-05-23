as yet unclassified
displayBook
  self
    display: [ 
      RectangleMorph new openInWorld.
      (BookMorphViewer for: bookMorph)
        position: 20 @ 20;
        openInWorld ]