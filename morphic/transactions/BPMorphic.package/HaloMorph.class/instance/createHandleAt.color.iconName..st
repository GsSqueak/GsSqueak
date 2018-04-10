private
createHandleAt: aPoint color: aColor iconName: iconName
  | _gsSqueakTemp_bou _gsSqueakTemp_handle |
  _gsSqueakTemp_bou := Rectangle center: aPoint extent: self handleSize asPoint.
  Preferences alternateHandlesLook
    ifTrue: [ 
      _gsSqueakTemp_handle := RectangleMorph
        newBounds: _gsSqueakTemp_bou
        color: aColor.
      _gsSqueakTemp_handle useRoundedCorners.
      self setColor: aColor toHandle: _gsSqueakTemp_handle ]
    ifFalse: [ _gsSqueakTemp_handle := EllipseMorph newBounds: _gsSqueakTemp_bou color: aColor ].
  _gsSqueakTemp_handle
    borderWidth: 0;
    wantsYellowButtonMenu: false.	""
  iconName isNil
    ifFalse: [ 
      | form |
      form := ScriptingSystem formAtKey: iconName.
      form isNil
        ifFalse: [ 
          | image |
          image := ImageMorph new.
          image image: form.
          image color: aColor makeForegroundColor.
          image lock.
          _gsSqueakTemp_handle addMorphCentered: image ] ].	""
  ^ _gsSqueakTemp_handle