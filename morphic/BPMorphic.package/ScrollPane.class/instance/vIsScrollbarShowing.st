geometry testing
vIsScrollbarShowing
  "Return true if a retractable scroll bar is currently showing"

  ^ scrollBar notNil and: [ scrollBar owner notNil ]