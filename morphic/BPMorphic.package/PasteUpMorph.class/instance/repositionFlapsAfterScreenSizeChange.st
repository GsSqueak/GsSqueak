world state
repositionFlapsAfterScreenSizeChange
  "Reposition flaps after screen size change"

  Flaps globalFlapTabsIfAny
    , (SessionTemps current at: #'ActiveWorld') localFlapTabs
    do: [ :aFlapTab | aFlapTab applyEdgeFractionWithin: self bounds ].
  Flaps doAutomaticLayoutOfFlapsIfAppropriate