-MorphicExtras-class initialization
unload
  "Unload the receiver from global registries"

  self environment
    at: #'Flaps'
    ifPresent: [ :cl | cl unregisterQuadsWithReceiver: ScriptingSystem ]