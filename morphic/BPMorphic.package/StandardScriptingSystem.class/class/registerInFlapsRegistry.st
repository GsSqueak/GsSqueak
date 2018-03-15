-MorphicExtras-class initialization
registerInFlapsRegistry
  "Register the receiver in the system's flaps registry"

  self environment
    at: #'Flaps'
    ifPresent: [ :cl | 
      cl
        registerQuad:
          {#'ScriptingSystem'.
          #'prototypicalHolder'.
          ('Holder' translatedNoop).
          ('A place for storing alternative pictures in an animation, etc.'
            translatedNoop)}
        forFlapNamed: 'PlugIn Supplies'.
      cl
        registerQuad:
          {#'ScriptingSystem'.
          #'prototypicalHolder'.
          ('Holder' translatedNoop).
          ('A place for storing alternative pictures in an animation, etc.'
            translatedNoop)}
        forFlapNamed: 'Supplies'.
      cl
        registerQuad:
          {#'ScriptingSystem'.
          #'newScriptingSpace'.
          ('Scripting' translatedNoop).
          ('A confined place for drawing and scripting, with its own private stop/step/go buttons.'
            translatedNoop)}
        forFlapNamed: 'Widgets'.
      cl
        registerQuad:
          {#'ScriptingSystem'.
          #'holderWithAlphabet'.
          ('Alphabet' translatedNoop).
          ('A source for single-letter objects' translatedNoop)}
        forFlapNamed: 'Widgets' ]