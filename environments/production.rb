name "production"
description "For Prods!"
cookbook "apache", "= 0.2.3"
override_attributes({
  "pci" => {
    "in_scope" => true
  }
})