-Etoys-card in a stack
addStackItemsTo: aMenu
  "Add stack-related items to the menu"

  | _gsSqueakTemp_stackSubMenu |
  _gsSqueakTemp_stackSubMenu := MenuMorph new defaultTarget: self.
  (self owner notNil and: [ self owner isStackBackground ])
    ifTrue: [ 
      self isShared
        ifTrue: [ 
          _gsSqueakTemp_stackSubMenu
            add: 'remove from Background' translated
            target: self
            action: #'putOnForeground'.
          self couldHoldSeparateDataForEachInstance
            ifTrue: [ 
              self holdsSeparateDataForEachInstance
                ifTrue: [ 
                  _gsSqueakTemp_stackSubMenu
                    add:
                      'stop holding separate data for each instance' translated
                    target: self
                    action: #'stopHoldingSeparateDataForEachInstance' ]
                ifFalse: [ 
                  _gsSqueakTemp_stackSubMenu
                    add:
                      'start holding separate data for each instance' translated
                    target: self
                    action: #'makeHoldSeparateDataForEachInstance' ].
              _gsSqueakTemp_stackSubMenu
                add: 'be default value on new card' translated
                target: self
                action: #'setAsDefaultValueForNewCard'.
              (self hasProperty: #'thumbnailImage')
                ifTrue: [ 
                  _gsSqueakTemp_stackSubMenu
                    add: 'stop using for reference thumbnail' translated
                    target: self
                    action: #'stopUsingForReferenceThumbnail' ]
                ifFalse: [ 
                  _gsSqueakTemp_stackSubMenu
                    add: 'start using for reference thumbnail' translated
                    target: self
                    action: #'startUsingForReferenceThumbnail' ] ] ]
        ifFalse: [ 
          self couldHoldSeparateDataForEachInstance
            ifTrue: [ 
              _gsSqueakTemp_stackSubMenu
                add: 'Background field, shared value' translated
                target: self
                action: #'putOnBackground'.
              _gsSqueakTemp_stackSubMenu
                add: 'Background field, individual values' translated
                target: self
                action: #'becomeSharedBackgroundField' ]
            ifFalse: [ 
              _gsSqueakTemp_stackSubMenu
                add: 'put onto Background' translated
                target: self
                action: #'putOnBackground' ] ].
      _gsSqueakTemp_stackSubMenu addLine ].
  self isStackBackground
    ifFalse: [ 
      _gsSqueakTemp_stackSubMenu
        add: 'be a card in an existing stack...' translated
        action: #'insertAsStackBackground' ].
  _gsSqueakTemp_stackSubMenu
    add: 'make an instance for my data' translated
    action: #'abstractAModel'.
  self isStackBackground
    ifFalse: [ 
      _gsSqueakTemp_stackSubMenu
        add: 'become a stack of cards' translated
        action: #'wrapWithAStack' ].
  aMenu
    add: 'stacks and cards...' translated
    subMenu: _gsSqueakTemp_stackSubMenu