menu
buildYellowButtonMenu: aHand
  "build the morph menu for the yellow button"

  | menu |
  menu := MenuMorph new defaultTarget: self.
  self
    addNestedYellowButtonItemsTo: menu
    event: (SessionTemps current at: #'ActiveEvent').
  MenuIcons decorateMenu: menu.
  ^ menu