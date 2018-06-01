class initialization
registerInFlapsRegistry
  "Register the receiver in the system's flaps registry"

  self environment
    at: #'Flaps'
    ifPresent: [ :cl | 
      cl
        registerQuad:
          {#'ImageMorph'.
          #'authoringPrototype'.
          'Picture'.
          'A non-editable picture of something'}
        forFlapNamed: 'Supplies' ]