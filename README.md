# Sweater Weather (or is it Whether, Sweater?)

This is the final project of Mod 3 (of 4) at Turing School of Software and Design in Denver, CO. It is the backend portion of a service-oriented architecture. We were provided with detailed wire frames and/or the expected JSON response from the front end, and asked to consume multiple external APIs to gather and format the data required.

# Endpoints

`GET '/api/v1/backgrounds?location=<city>,<state>'`

example response for this response: `GET '/api/v1/backgrounds?location=denver,co'`

    `{:data=>
      {:id=>nil,
       :type=>"background",
       :attributes=>
        {:image_url=>
          ["https://images.unsplash.com/photo-1580408597610-51b1ad419857?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE1MzY1MH0"]}}}`

`GET '/api/v1/forecast?location=<city>,<state>'`

example response for this response: `GET '/api/v1/forecast?location=denver,co'`

      `{:data=>
        {:id=>nil,
         :type=>"forecast",
         :attributes=>
          {:location=>"denver,co",
           :current=>
            {:overview=>
              {:temperature=>85.66,
               :description=>"moderate rain",
               :date=>"August 4",
               :time=>" 6:22 PM",
               :high=>85.66,
               :low=>75.22},
             :details=>
              {:sunrise=>" 6:02 AM",
               :sunset=>" 8:09 PM",
               :feels_like=>79.38,
               :humidity=>28,
               :visibility=>6977,
               :uv_index=>10.81}},
           :hourly=>
            [{:hour=>"07 PM", :temperature=>77.5},
             {:hour=>"08 PM", :temperature=>72.23},
             {:hour=>"09 PM", :temperature=>71.04},
             {:hour=>"10 PM", :temperature=>72.21},
             {:hour=>"11 PM", :temperature=>73.31},
             {:hour=>"12 AM", :temperature=>72.34},
             {:hour=>"01 AM", :temperature=>71.35},
             {:hour=>"02 AM", :temperature=>70.72}],
           :daily=>
            [{:day_of_week=>"Wednesday",
              :description=>"Rain",
              :percipitation=>1.53,
              :high=>89.71,
              :low=>69.51},
             {:day_of_week=>"Thursday",
              :description=>"Rain",
              :percipitation=>0.17,
              :high=>93.54,
              :low=>68.16},
             {:day_of_week=>"Friday",
              :description=>"Rain",
              :percipitation=>0.72,
              :high=>93.0,
              :low=>73.56},
             {:day_of_week=>"Saturday",
              :description=>"Clear",
              :percipitation=>0.0,
              :high=>94.15,
              :low=>73.4},
             {:day_of_week=>"Sunday",
              :description=>"Clouds",
              :percipitation=>0.0,
              :high=>91.76,
              :low=>74.52}]}}}`

___

`POST '/api/v1/users?email=<email>&password=<password>&password_confirmation=<password confirmation>'`

example response for this response: `POST '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'`

      `{:data=>
        {:id=>"524",
         :type=>"users",
         :attributes=>
          {:email=>"whatever@example.com", :api_key=>"c5875144080529943bf0"}}}`

___

`POST '/api/v1/sessions?email=<email>&password=<password>'`

example response for this response: `'/api/v1/sessions?email=email@example.com&password=thepassword'`

      `{:status=>200,
       :body=>
        {:data=>
          {:id=>"521",
           :type=>"users",
           :attributes=>
            {:email=>"whatever@example.com",
             :api_key=>"fee168326c00c3d72897"}}}}`

___

`POST '/api/v1/road_trip?origin=<city>,<state>&destination=<city>,<state>&api_key=<api_key>'`

example response for this response: `POST '/api/v1/road_trip?origin=denver,co&destination=pueblo,co&api_key=<api_key>'`

    `{:data=>
      {:id=>"94",
       :type=>"road_trip",
       :attributes=>
        {:origin=>"denver,co",
         :destination=>"pueblo,co",
         :duration=>"6237",
         :temperature=>70.72,
         :description=>"broken clouds"}}}`
