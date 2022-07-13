-- Comments in SQL Start with dash-dash --
-- 1.
playstore=# SELECT app_name FROM analytics WHERE id = 1880;
        app_name         
-------------------------
 Web Browser for Android
(1 row)

-- 2.
playstore=# SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';
-- list too long to add in (275 rows)

-- 3.
playstore=# SELECT category, COUNT(*) FROM analytics GROUP BY category;
      category       | count 
---------------------+-------
 BOOKS_AND_REFERENCE |   191
 COMMUNICATION       |   342
 BEAUTY              |    46
 EVENTS              |    52
 PARENTING           |    59
 PHOTOGRAPHY         |   313
 GAME                |  1110
 BUSINESS            |   313
 SOCIAL              |   269
 MEDICAL             |   350
 TOOLS               |   753
 TRAVEL_AND_LOCAL    |   234
 ART_AND_DESIGN      |    63
 LIFESTYLE           |   319
 WEATHER             |    79
 COMICS              |    59
 PRODUCTIVITY        |   360
 PERSONALIZATION     |   329
 FINANCE             |   331
 SPORTS              |   338
 ENTERTAINMENT       |   149
 NEWS_AND_MAGAZINES  |   249
 HOUSE_AND_HOME      |    82
 SHOPPING            |   241
 DATING              |   204
 HEALTH_AND_FITNESS  |   298
 EDUCATION           |   156
 MAPS_AND_NAVIGATION |   129
 LIBRARIES_AND_DEMO  |    80
 FOOD_AND_DRINK      |   110
 FAMILY              |  1789
 VIDEO_PLAYERS       |   165
 AUTO_AND_VEHICLES   |    75
(33 rows)

-- 4.
playstore=# SELECT app_name, reviews FROM analytics ORDER BY reviews DESC LIMIT 5;
                 app_name                 | reviews  
------------------------------------------+----------
 Facebook                                 | 78158306
 WhatsApp Messenger                       | 78128208
 Instagram                                | 69119316
 Messenger – Text and Video Chat for Free | 69119316
 Clash of Clans                           | 69109672
(5 rows)

-- 5.
playstore=# SELECT * FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;
 id  |  app_name  |      category      | rating | reviews |        size        | min_installs | price | content_rating |        genres        | last_updated |  current_version   |  android_version   
-----+------------+--------------------+--------+---------+--------------------+--------------+-------+----------------+----------------------+--------------+--------------------+--------------------
 260 | Chess Free | HEALTH_AND_FITNESS |    4.8 | 4559407 | Varies with device |    100000000 |     0 | Everyone       | {"Health & Fitness"} | 2018-08-01   | Varies with device | Varies with device
(1 row)

-- 6.
playstore=# SELECT category, AVG(rating) FROM analytics GROUP BY category ORDER BY AVG DESC;
      category       |        avg         
---------------------+--------------------
 EVENTS              |  4.395238104320708
 EDUCATION           |   4.38903223006956
 ART_AND_DESIGN      |  4.347540949211746
 BOOKS_AND_REFERENCE | 4.3423728633061645
 PERSONALIZATION     |    4.3283387457509
 BEAUTY              |  4.299999970656175
 GAME                |  4.287167731498383
 PARENTING           |  4.285714266251545
 HEALTH_AND_FITNESS  | 4.2743944663902464
 SHOPPING            |  4.253648051376507
 SOCIAL              |  4.245669291244717
 WEATHER             |   4.24399998664856
 SPORTS              |  4.233333332576449
 PRODUCTIVITY        |  4.212173904543338
 AUTO_AND_VEHICLES   |  4.200000017881393
 HOUSE_AND_HOME      |  4.197368430463891
 PHOTOGRAPHY         |  4.196116511489967
 MEDICAL             | 4.1926829182520144
 FAMILY              | 4.1904873752761995
 LIBRARIES_AND_DEMO  | 4.1784615259904125
 FOOD_AND_DRINK      |  4.155660354866172
 COMICS              |  4.155172401461108
 COMMUNICATION       |  4.151234589241169
 FINANCE             |  4.146835436549368
 NEWS_AND_MAGAZINES  |  4.130131007281974
 ENTERTAINMENT       |   4.12617449632427
 BUSINESS            |  4.116666667004849
 TRAVEL_AND_LOCAL    |   4.10179372753263
 LIFESTYLE           |  4.077076400237226
 VIDEO_PLAYERS       |  4.059748438919115
 MAPS_AND_NAVIGATION |  4.058196711735647
 TOOLS               |  4.050627608678331
 DATING              |  3.993684190825412
(33 rows)

-- 7.
playstore=# SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;
      app_name      | price  | rating 
--------------------+--------+--------
 Naruto & Boruto FR | 379.99 |    2.9
(1 row)

-- 8.
playstore=# SELECT * FROM analytics WHERE min_installs <= 50 AND rating > 0 ORDER BY rating DESC;
  id  |                    app_name                    |      category       | rating | reviews | size | min_installs | price | content_rating |        genres         | last_updated |  current_version   | android_version 
------+------------------------------------------------+---------------------+--------+---------+------+--------------+-------+----------------+-----------------------+--------------+--------------------+-----------------
 9468 | DT                                             | FAMILY              |      5 |       4 | 52M  |           50 |     0 | Everyone       | {Education}           | 2018-04-03   | 1.1                | 4.1 and up
 9464 | DQ Akses                                       | PERSONALIZATION     |      5 |       4 | 31M  |           50 |  0.99 | Everyone       | {Personalization}     | 2018-04-27   | 1.1                | 4.1 and up
 9453 | DM Adventure                                   | MEDICAL             |      5 |       4 | 25M  |            1 |     0 | Everyone       | {Medical}             | 2018-08-02   | 1.0.72             | 4.0.3 and up
 9427 | db Meter - sound level meter with data logging | GAME                |      5 |       5 | 4.6M |           10 |     0 | Everyone       | {Racing}              | 2018-08-01   | 1.11               | 4.0.3 and up
 9452 | Otto DM                                        | MEDICAL             |      5 |       4 | 2.5M |            5 |     0 | Everyone       | {Medical}             | 2018-08-03   | 1                  | 4.1 and up
 9431 | ElejaOnline DF                                 | FAMILY              |      5 |       5 | 15M  |           50 |     0 | Everyone       | {Education}           | 2017-10-06   | 2.3.3              | 4.4 and up
 8785 | Labs on Demand                                 | BUSINESS            |      5 |      14 | 3.3M |           50 |     0 | Everyone       | {Business}            | 2018-02-01   | 1                  | 4.0 and up
 9602 | FK Events                                      | MEDICAL             |      5 |       3 | 53M  |           10 |     0 | Everyone       | {Medical}             | 2018-07-13   | 0.1                | 4.1 and up
 8926 | My CW                                          | GAME                |      5 |      11 | 6.1M |           10 |     0 | Everyone       | {Arcade}              | 2017-03-11   | 0.1                | 2.3 and up
 8629 | Dr.Dice - Sic bo analyzer                      | FAMILY              |      5 |      18 | 1.3M |           50 |     0 | Everyone       | {Casual}              | 2018-02-13   | 1                  | 4.3 and up
 9021 | BTK-FH Online Campus                           | SHOPPING            |      5 |       9 | 169k |           10 |     0 | Everyone       | {Shopping}            | 2018-06-01   | 18060104           | 2.2 and up
 9552 | EU Whoiswho                                    | HEALTH_AND_FITNESS  |      5 |       4 | 15M  |           50 |     0 | Everyone       | {"Health & Fitness"}  | 2018-03-23   | 7.7.3              | 4.1 and up
 9057 | Wifi Mingle                                    | PRODUCTIVITY        |      5 |       9 | 25M  |           50 |     0 | Everyone       | {Productivity}        | 2018-02-11   | 1.7.8              | 4.0.3 and up
 9092 | Lord Fairfax EMS Council                       | GAME                |      5 |       8 | 25M  |           50 |     0 | Everyone       | {Arcade}              | 2018-06-26   | 1.1                | 4.1 and up
 9548 | E.U. Trademark Search Tool                     | GAME                |      5 |       4 | 33M  |           50 |  1.99 | Teen           | {Action}              | 2013-08-15   | 1.05               | 2.2 and up
 9112 | Popsicle Launcher for Android P 9.0 launcher   | FAMILY              |      5 |       8 | 14M  |           10 |     0 | Everyone       | {Education}           | 2018-08-01   | 1.1                | 4.2 and up
 9115 | Q Actions - Digital Assistant                  | GAME                |      5 |       8 | 38M  |           10 |  0.99 | Teen           | {Arcade}              | 2018-04-11   | 1.3                | 4.1 and up
 9132 | Border Ag & Energy                             | FAMILY              |      5 |       8 | 7.4M |           50 |     0 | Everyone       | {Education}           | 2018-08-07   | 1.0.2              | 4.1 and up
 9184 | AQ: First Contact                              | GAME                |      5 |       7 | 19M  |            5 |     0 | Everyone       | {Arcade}              | 2018-07-23   | 1                  | 4.1 and up
 9185 | AQ wisdom +                                    | FAMILY              |      5 |       7 | 5.6M |           10 |     0 | Everyone       | {Education}           | 2017-12-07   | 1                  | 4.0.3 and up
 9189 | AQ Dentals                                     | FAMILY              |      5 |       7 | 20M  |           50 |     0 | Everyone       | {Education}           | 2016-09-10   | 1.2.0              | 4.1 and up
 9215 | British Columbia Transit Info                  | FAMILY              |      5 |       7 | 73M  |           10 |  0.99 | Everyone       | {Puzzle}              | 2017-07-06   | 1.2                | 4.1 and up
 8661 | CI On The Go                                   | SPORTS              |      5 |      17 | 1.5M |           50 |     0 | Everyone       | {Sports}              | 2017-12-08   | 1                  | 4.0.3 and up
 8553 | Radio FG Paris Underground                     | SOCIAL              |      5 |      20 | 4.2M |           10 |     0 | Teen           | {Social}              | 2018-07-23   | 1                  | 4.0 and up
 9297 | BV Bombers                                     | TOOLS               |      5 |       6 | 4.5M |           50 |     0 | Everyone       | {Tools}               | 2018-06-05   | 1.0.2              | 4.1 and up
 9501 | EC Designer 2.0                                | FINANCE             |      5 |       4 | 4.1M |           50 |     0 | Everyone       | {Finance}             | 2018-07-14   | 1.0.4              | 4.2 and up
 8724 | EP FCU                                         | FAMILY              |      5 |      15 | 94M  |           50 |     0 | Everyone       | {Education}           | 2018-07-11   | 2                  | 4.0.3 and up
 9367 | Pekalongan CJ                                  | BOOKS_AND_REFERENCE |      5 |       5 | 7.2M |           50 |  1.75 | Everyone       | {"Books & Reference"} | 2015-10-08   | 1                  | 4.1 and up
 9387 | CQ SIGNAL PRO 5                                | COMMUNICATION       |      5 |       5 | 3.7M |           50 |     0 | Everyone       | {Communication}       | 2018-04-02   | 1                  | 4.0 and up
 9388 | HR Team CQ Region Ed Qld                       | SOCIAL              |      5 |       5 | 1.8M |            5 |     0 | Everyone       | {Social}              | 2018-08-04   | 1.2.4              | 5.0 and up
 9485 | iCluster - The DX-Cluster database             | FINANCE             |      5 |       4 | 11M  |           50 |     0 | Everyone       | {Finance}             | 2018-05-25   | 1.0.0              | 4.4 and up
 9612 | MY GULFPORT FL                                 | LIFESTYLE           |      5 |       3 | 8.6M |           50 |     0 | Everyone       | {Lifestyle}           | 2017-05-23   | 1                  | 4.1 and up
 9516 | Sensenuts eI                                   | FINANCE             |    4.8 |       4 | 5.1M |           50 |     0 | Everyone       | {Finance}             | 2018-05-23   | 1.0.17.0423        | 5.0 and up
 8641 | BW t&t                                         | TOOLS               |    4.8 |      17 | 6.7M |           50 |     0 | Everyone       | {Tools}               | 2018-05-05   | v2                 | 4.4 and up
 8962 | DT CLOTHINGS                                   | HEALTH_AND_FITNESS  |    4.8 |      10 | 4.0M |           10 |     0 | Everyone       | {"Health & Fitness"}  | 2018-06-13   | 3.55               | 4.0 and up
 9268 | Miller’s Bar B-Q                               | COMMUNICATION       |    4.8 |       6 | 21M  |           10 |     0 | Everyone       | {Communication}       | 2018-07-04   | 2                  | 4.1 and up
 9360 | All-night drugstore CI & Price                 | PERSONALIZATION     |    4.8 |       5 | 35M  |           50 |  0.99 | Everyone       | {Personalization}     | 2018-04-22   | 1.1                | 4.1 and up
 9415 | CY Spray nozzle                                | FAMILY              |    4.8 |       5 | 1.5M |           10 |     0 | Everyone       | {Education}           | 2017-09-18   | 1                  | 2.3 and up
 9486 | DY Fitness                                     | FAMILY              |    4.8 |       4 | 23M  |           10 | 14.99 | Teen           | {Casual}              | 2018-01-24   | 1.03               | 2.3.3 and up
 9626 | Custos F.O.                                    | TOOLS               |    4.7 |       3 | 5.3M |           10 |  2.99 | Everyone       | {Tools}               | 2018-05-27   | 1.0.15             | 4.4 and up
 8726 | ER                                             | GAME                |    4.6 |      15 | 3.2M |           50 |     0 | Everyone       | {Arcade}              | 2017-07-05   | 1.3                | 4.0.3 and up
 8856 | BL File Explorer                               | GAME                |    4.6 |      12 | 18M  |           50 |     0 | Everyone       | {Arcade}              | 2017-07-31   | Varies with device | 4.1 and up
 9498 | Audiowalk EB                                   | PERSONALIZATION     |    4.5 |       4 | 511k |           50 |     0 | Everyone       | {Personalization}     | 2016-12-31   | 1.4                | 4.0 and up
 9499 | Ec Solutions Mobile                            | PERSONALIZATION     |    4.5 |       4 | 1.7M |           10 |     0 | Everyone       | {Personalization}     | 2018-02-28   | 1.1                | 4.4 and up
 9283 | BT Satmeter                                    | MAPS_AND_NAVIGATION |    4.5 |       6 | 2.5M |           50 |     0 | Everyone       | {"Maps & Navigation"} | 2018-07-28   | 2.1                | 4.0 and up
 9044 | FQ - Football Quiz                             | TOOLS               |    4.4 |       9 | 33M  |           50 |  2.99 | Everyone       | {Tools}               | 2018-05-03   | 0.6.2              | 4.3 and up
 9422 | Reksio cz. 1                                   | PERSONALIZATION     |    4.4 |       5 | 3.4M |           50 |  0.99 | Everyone       | {Personalization}     | 2015-03-20   | 2                  | 3.0 and up
 9335 | CE Genius Nurses Edition                       | PERSONALIZATION     |    4.2 |       6 | 89k  |           50 |  0.99 | Everyone       | {Personalization}     | 2013-08-09   | 1                  | 2.2 and up
 9429 | DF-View                                        | FAMILY              |    4.2 |       5 | 54M  |           50 |     0 | Teen           | {"Role Playing"}      | 2018-07-31   | 4541.25.51         | 4.1 and up
 9424 | ReDNAKET DB Normalization Tool                 | FAMILY              |    4.2 |       5 | 40M  |           50 |  1.49 | Everyone       | {Puzzle}              | 2014-05-20   | 1.7                | 2.0.1 and up
 9522 | Ek IRA                                         | GAME                |    4.2 |       4 | 61M  |           10 |     0 | Everyone       | {Action}              | 2018-05-13   | 1.1                | 4.4 and up
 9504 | EC-Contractors                                 | SHOPPING            |      4 |       4 | 2.4M |           10 |     0 | Everyone       | {Shopping}            | 2017-08-04   | 1                  | 4.1 and up
 9635 | Word Search Tab 1 FR                           | FAMILY              |    3.7 |       3 | 10M  |           50 |     0 | Everyone       | {Entertainment}       | 2015-10-04   | 1.0.0              | 2.2 and up
 9414 | Cy’s Elma Pharmacy                             | BUSINESS            |    3.6 |       5 | 6.8M |           50 |  8.99 | Everyone       | {Business}            | 2018-04-30   | 6                  | 4.0.3 and up
 9104 | F-1 watchface by Delta                         | MAPS_AND_NAVIGATION |    3.5 |       8 | 26M  |           10 |     0 | Everyone       | {"Maps & Navigation"} | 2018-01-17   | 1.2.20180117       | 4.1 and up
 9444 | Dr D K Olukoya                                 | GAME                |    3.4 |       5 | 21M  |           50 |     0 | Everyone       | {Arcade}              | 2015-08-25   | 1                  | 2.3 and up
 9416 | BibleRead En Cy Zh Yue                         | FAMILY              |    2.8 |       5 | 629k |           50 |  0.99 | Everyone       | {"Role Playing"}      | 2015-01-31   | 1.0.0              | 2.3.3 and up
(57 rows)

-- 9.
playstore=# SELECT * FROM analytics WHERE rating < 3 AND reviews >= 10000;
  id  |                    app_name                     | category | rating | reviews | size | min_installs | price | content_rating |            genres             | last_updated | current_version | android_version 
------+-------------------------------------------------+----------+--------+---------+------+--------------+-------+----------------+-------------------------------+--------------+-----------------+-----------------
 2121 | The Wall Street Journal: Business & Market News | FAMILY   |    2.8 |  107441 | 32M  |      1000000 |     0 | Everyone       | {Casual,"Action & Adventure"} | 2018-07-10   | 1.10.5          | 4.4 and up
 3251 | Vikings: an Archer’s Journey                    | FAMILY   |    2.9 |   31596 | 31M  |      5000000 |     0 | Teen           | {Simulation}                  | 2016-12-23   | 1.5             | 2.3 and up
 4134 | Shoot Em Down Free                              | FAMILY   |    2.4 |   11773 | 3.3M |      1000000 |     0 | Everyone       | {Entertainment}               | 2018-06-13   | 18.6.2          | 4.1 and up
(3 rows)

-- 10.
playstore=# SELECT * FROM analytics WHERE price > .10 AND price < 1.00 ORDER BY reviews DESC LIMIT 10;
  id  |                  app_name                   |    category     | rating | reviews | size | min_installs | price | content_rating |            genres             | last_updated | current_version | android_version 
------+---------------------------------------------+-----------------+--------+---------+------+--------------+-------+----------------+-------------------------------+--------------+-----------------+-----------------
 1144 | Free Slideshow Maker & Video Editor         | GAME            |    4.6 |  408292 | 29M  |     10000000 |  0.99 | Mature 17+     | {Action}                      | 2018-07-12   | 1.7.110758      | 4.1 and up
 2298 | Couple - Relationship App                   | GAME            |    4.3 |   85468 | 36M  |      1000000 |  0.99 | Everyone       | {Arcade}                      | 2018-06-08   | 2.4.1.485300    | 4.0.3 and up
 2315 | Anime X Wallpaper                           | FAMILY          |    4.6 |   84114 | 23M  |       500000 |  0.99 | Everyone 10+   | {Puzzle}                      | 2018-07-05   | 1.13.108869     | 2.3.3 and up
 2603 | Dance On Mobile                             | FAMILY          |    4.6 |   61264 | 43M  |      1000000 |  0.99 | Everyone       | {Puzzle}                      | 2018-06-19   | 3.7.0           | 4.1 and up
 2645 | Marvel Unlimited                            | PERSONALIZATION |    4.3 |   58617 | 26M  |      1000000 |  0.99 | Everyone       | {Personalization}             | 2016-12-07   | 4.3.2           | 4.4 and up
 2646 | FastMeet: Chat, Dating, Love                | PERSONALIZATION |    4.3 |   58614 | 26M  |      1000000 |  0.99 | Everyone       | {Personalization}             | 2016-12-07   | 4.3.2           | 4.4 and up
 2811 | IHG®: Hotel Deals & Rewards                 | FAMILY          |    4.5 |   48754 | 9.3M |       100000 |  0.99 | Everyone       | {Arcade,"Action & Adventure"} | 2014-10-07   | 1.5.2           | 2.3 and up
 3050 | Live Weather & Daily Local Weather Forecast | GAME            |    4.4 |   38419 | 100M |      1000000 |  0.99 | Everyone 10+   | {Action}                      | 2018-08-03   | 2.3.24          | 4.1 and up
 3214 | DreamMapper                                 | GAME            |    4.4 |   32496 | 99M  |      1000000 |  0.99 | Teen           | {Action}                      | 2018-07-03   | 5.3.3           | 2.3 and up
 3227 | Můj T-Mobile Business                       | GAME            |    4.5 |   32344 | 29M  |      1000000 |  0.99 | Everyone       | {Adventure}                   | 2016-10-21   | 1.3.12          | 3.0 and up
(10 rows)

-- 11.
playstore=# SELECT * FROM analytics ORDER BY last_updated ASC LIMIT 1;
  id  |  app_name  | category | rating | reviews | size | min_installs | price | content_rating |     genres      | last_updated | current_version | android_version 
------+------------+----------+--------+---------+------+--------------+-------+----------------+-----------------+--------------+-----------------+-----------------
 5701 | CP Clicker | FAMILY   |    4.2 |    1415 | 209k |       100000 |     0 | Everyone       | {Entertainment} | 2010-05-21   | 3.1             | 1.5 and up
(1 row)

-- 12.
playstore=# SELECT * FROM analytics ORDER BY price DESC LIMIT 1;
  id  |      app_name      | category  | rating | reviews | size | min_installs | price | content_rating |   genres    | last_updated | current_version | android_version 
------+--------------------+-----------+--------+---------+------+--------------+-------+----------------+-------------+--------------+-----------------+-----------------
 6766 | Cardi B Piano Game | LIFESTYLE |    3.6 |     275 | 7.3M |        10000 |   400 | Everyone       | {Lifestyle} | 2018-05-03   | 1.0.1           | 4.1 and up
(1 row)

-- 13.
playstore=# SELECT SUM(reviews) AS "Total Reviews" FROM analytics;
 Total Reviews 
---------------
    4814575866
(1 row)

-- 14.
playstore=# SELECT category FROM analytics GROUP BY category HAVING COUNT(*) > 300;
    category     
-----------------
 COMMUNICATION
 PHOTOGRAPHY
 GAME
 BUSINESS
 MEDICAL
 TOOLS
 LIFESTYLE
 PRODUCTIVITY
 PERSONALIZATION
 FINANCE
 SPORTS
 FAMILY
(12 rows)

-- 15.
playstore=# SELECT app_name, reviews, min_installs, min_installs/reviews AS proportion FROM analytics WHERE min_installs >= 100000 ORDER BY proportion DESC LIMIT 1;
     app_name     | reviews | min_installs | proportion 
------------------+---------+--------------+------------
 Kim Bu Youtuber? |      66 |     10000000 |     151515
(1 row)

