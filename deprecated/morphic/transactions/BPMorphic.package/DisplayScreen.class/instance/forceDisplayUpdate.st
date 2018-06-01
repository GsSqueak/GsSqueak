other
forceDisplayUpdate
  "On platforms that buffer screen updates, force the screen to be
	updated immediately. On other platforms, or if the primitive is not
	implemented, do nothing."

  "do nothing if primitive fails"

  self forceToScreen.	"HACK"
  ^ self