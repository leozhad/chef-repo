name "webserver"
description "webserver"
run_list "recipe[apache]"
default_attributes({
    "apache" => {
      "sites" => {
        "ponies" => {
          "port" => 82
        },
        "bears" => {
          "port" => 83
        }
      }
    }
  })