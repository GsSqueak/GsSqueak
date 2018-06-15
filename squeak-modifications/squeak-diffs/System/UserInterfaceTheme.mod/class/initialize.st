initialization
initialize
    "Avoid calling apply which makes use of allObjects during GsSqueak bootstrap"
    self current: self default
