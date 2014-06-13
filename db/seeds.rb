require 'csv'
require 'open-uri'

Football.delete_all

string = "1,Thu,September 4,Green Bay Packers,Seattle Seahawks,8:30 PM
1,Sun,September 7,New Orleans Saints,Atlanta Falcons,1:00 PM
1,Sun,September 7,Buffalo Bills,Chicago Bears,1:00 PM
1,Sun,September 7,Washington Redskins,Houston Texans,1:00 PM
1,Sun,September 7,Tennessee Titans,Kansas City Chiefs,1:00 PM
1,Sun,September 7,New England Patriots,Miami Dolphins,1:00 PM
1,Sun,September 7,Oakland Raiders,New York Jets,1:00 PM
1,Sun,September 7,Jacksonville Jaguars,Philadelphia Eagles,1:00 PM
1,Sun,September 7,Cleveland Browns,Pittsburgh Steelers,1:00 PM
1,Sun,September 7,Minnesota Vikings,St. Louis Rams,1:00 PM
1,Sun,September 7,Cincinnati Bengals,Baltimore Ravens,1:00 PM
1,Sun,September 7,San Francisco 49ers,Dallas Cowboys,4:25 PM
1,Sun,September 7,Carolina Panthers,Tampa Bay Buccaneers,4:25 PM
1,Sun,September 7,Indianapolis Colts,Denver Broncos,8:30 PM
1,Mon,September 8,San Diego Chargers,Arizona Cardinals,10:20 PM
1,Mon,September 8,New York Giants,Detroit Lions,7:10 PM
2,Thu,September 11,Pittsburgh Steelers,Baltimore Ravens,8:25 PM
2,Sun,September 14,Miami Dolphins,Buffalo Bills,1:00 PM
2,Sun,September 14,Detroit Lions,Carolina Panthers,1:00 PM
2,Sun,September 14,Atlanta Falcons,Cincinnati Bengals,1:00 PM
2,Sun,September 14,New Orleans Saints,Cleveland Browns,1:00 PM
2,Sun,September 14,New England Patriots,Minnesota Vikings,1:00 PM
2,Sun,September 14,Arizona Cardinals,New York Giants,1:00 PM
2,Sun,September 14,Dallas Cowboys,Tennessee Titans,1:00 PM
2,Sun,September 14,Jacksonville Jaguars,Washington Redskins,1:00 PM
2,Sun,September 14,Seattle Seahawks,San Diego Chargers,4:05 PM
2,Sun,September 14,St. Louis Rams,Tampa Bay Buccaneers,4:05 PM
2,Sun,September 14,Kansas City Chiefs,Denver Broncos,4:25 PM
2,Sun,September 14,New York Jets,Green Bay Packers,4:25 PM
2,Sun,September 14,Houston Texans,Oakland Raiders,4:25 PM
2,Sun,September 14,Chicago Bears,San Francisco 49ers,8:30 PM
2,Mon,September 15,Philadelphia Eagles,Indianapolis Colts,8:30 PM
3,Thu,September 18,Tampa Bay Buccaneers,Atlanta Falcons,8:25 PM
3,Sun,September 21,San Diego Chargers,Buffalo Bills,1:00 PM
3,Sun,September 21,Tennessee Titans,Cincinnati Bengals,1:00 PM
3,Sun,September 21,Baltimore Ravens,Cleveland Browns,1:00 PM
3,Sun,September 21,Green Bay Packers,Detroit Lions,1:00 PM
3,Sun,September 21,Indianapolis Colts,Jacksonville Jaguars,1:00 PM
3,Sun,September 21,Minnesota Vikings,New Orleans Saints,1:00 PM
3,Sun,September 21,Oakland Raiders,New England Patriots,1:00 PM
3,Sun,September 21,Houston Texans,New York Giants,1:00 PM
3,Sun,September 21,Washington Redskins,Philadelphia Eagles,1:00 PM
3,Sun,September 21,Dallas Cowboys,St. Louis Rams,1:00 PM
3,Sun,September 21,San Francisco 49ers,Arizona Cardinals,4:05 PM
3,Sun,September 21,Kansas City Chiefs,Miami Dolphins,4:25 PM
3,Sun,September 21,Denver Broncos,Seattle Seahawks,4:25 PM
3,Sun,September 21,Pittsburgh Steelers,Carolina Panthers,8:30 PM
3,Mon,September 22,Chicago Bears,New York Jets,8:30 PM
4,Thu,September 25,New York Giants,Washington Redskins,8:25 PM
4,Sun,September 28,Green Bay Packers,Chicago Bears,1:00 PM
4,Sun,September 28,Tennessee Titans,Indianapolis Colts,1:00 PM
4,Sun,September 28,Buffalo Bills,Houston Texans,1:00 PM
4,Sun,September 28,Detroit Lions,New York Jets,1:00 PM
4,Sun,September 28,Tampa Bay Buccaneers,Pittsburgh Steelers,1:00 PM
4,Sun,September 28,Miami Dolphins,Oakland Raiders,1:00 PM
4,Sun,September 28,Carolina Panthers,Baltimore Ravens,1:00 PM
4,Sun,September 28,Jacksonville Jaguars,San Diego Chargers,4:05 PM
4,Sun,September 28,Atlanta Falcons,Minnesota Vikings,4:25 PM
4,Sun,September 28,Philadelphia Eagles,San Francisco 49ers,4:25 PM
4,Sun,September 28,New Orleans Saints,Dallas Cowboys,8:30 PM
4,Mon,September 29,New England Patriots,Kansas City Chiefs,8:30 PM
5,Thu,October 2,Minnesota Vikings,Green Bay Packers,8:25 PM
5,Sun,October 5,Chicago Bears,Carolina Panthers,1:00 PM
5,Sun,October 5,Baltimore Ravens,Indianapolis Colts,1:00 PM
5,Sun,October 5,Houston Texans,Dallas Cowboys,1:00 PM
5,Sun,October 5,Buffalo Bills,Detroit Lions,1:00 PM
5,Sun,October 5,Pittsburgh Steelers,Jacksonville Jaguars,1:00 PM
5,Sun,October 5,Tampa Bay Buccaneers,New Orleans Saints,1:00 PM
5,Sun,October 5,Atlanta Falcons,New York Giants,1:00 PM
5,Sun,October 5,Cleveland Browns,Tennessee Titans,1:00 PM
5,Sun,October 5,St. Louis Rams,Philadelphia Eagles,1:00 PM
5,Sun,October 5,Arizona Cardinals,Denver Broncos,4:05 PM
5,Sun,October 5,New York Jets,San Diego Chargers,4:25 PM
5,Sun,October 5,Kansas City Chiefs,San Francisco 49ers,4:25 PM
5,Sun,October 5,Cincinnati Bengals,New England Patriots,8:30 PM
5,Mon,October 6,Seattle Seahawks,Washington Redskins,8:30 PM
6,Thu,October 9,Indianapolis Colts,Houston Texans,8:25 PM
6,Sun,October 12,Chicago Bears,Atlanta Falcons,1:00 PM
6,Sun,October 12,New England Patriots,Buffalo Bills,1:00 PM
6,Sun,October 12,Carolina Panthers,Cincinnati Bengals,1:00 PM
6,Sun,October 12,Pittsburgh Steelers,Cleveland Browns,1:00 PM
6,Sun,October 12,Green Bay Packers,Miami Dolphins,1:00 PM
6,Sun,October 12,Detroit Lions,Minnesota Vikings,1:00 PM
6,Sun,October 12,Denver Broncos,New York Jets,1:00 PM
6,Sun,October 12,Jacksonville Jaguars,Tennessee Titans,1:00 PM
6,Sun,October 12,Baltimore Ravens,Tampa Bay Buccaneers,1:00 PM
6,Sun,October 12,San Diego Chargers,Oakland Raiders,4:05 PM
6,Sun,October 12,Washington Redskins,Arizona Cardinals,4:25 PM
6,Sun,October 12,Dallas Cowboys,Seattle Seahawks,4:25 PM
6,Sun,October 12,New York Giants,Philadelphia Eagles,8:30 PM
6,Mon,October 13,San Francisco 49ers,St. Louis Rams,8:30 PM
7,Thu,October 16,New York Jets,New England Patriots,8:25 PM
7,Sun,October 19,Minnesota Vikings,Buffalo Bills,1:00 PM
7,Sun,October 19,Miami Dolphins,Chicago Bears,1:00 PM
7,Sun,October 19,Cincinnati Bengals,Indianapolis Colts,1:00 PM
7,Sun,October 19,New Orleans Saints,Detroit Lions,1:00 PM
7,Sun,October 19,Carolina Panthers,Green Bay Packers,1:00 PM
7,Sun,October 19,Cleveland Browns,Jacksonville Jaguars,1:00 PM
7,Sun,October 19,Seattle Seahawks,St. Louis Rams,1:00 PM
7,Sun,October 19,Atlanta Falcons,Baltimore Ravens,1:00 PM
7,Sun,October 19,Tennessee Titans,Washington Redskins,1:00 PM
7,Sun,October 19,Kansas City Chiefs,San Diego Chargers,4:05 PM
7,Sun,October 19,New York Giants,Dallas Cowboys,4:25 PM
7,Sun,October 19,Arizona Cardinals,Oakland Raiders,4:25 PM
7,Sun,October 19,San Francisco 49ers,Denver Broncos,8:30 PM
7,Mon,October 20,Houston Texans,Pittsburgh Steelers,8:30 PM
8,Thu,October 23,San Diego Chargers,Denver Broncos,8:25 PM
8,Sun,October 26,Seattle Seahawks,Carolina Panthers,1:00 PM
8,Sun,October 26,Baltimore Ravens,Cincinnati Bengals,1:00 PM
8,Sun,October 26,Miami Dolphins,Jacksonville Jaguars,1:00 PM
8,Sun,October 26,St. Louis Rams,Kansas City Chiefs,1:00 PM
8,Sun,October 26,Chicago Bears,New England Patriots,1:00 PM
8,Sun,October 26,Buffalo Bills,New York Jets,1:00 PM
8,Sun,October 26,Houston Texans,Tennessee Titans,1:00 PM
8,Sun,October 26,Minnesota Vikings,Tampa Bay Buccaneers,1:00 PM
8,Sun,October 26,Philadelphia Eagles,Arizona Cardinals,4:05 PM
8,Sun,October 26,Oakland Raiders,Cleveland Browns,4:25 PM
8,Sun,October 26,Indianapolis Colts,Pittsburgh Steelers,4:25 PM
8,Sun,October 26,Green Bay Packers,New Orleans Saints,8:30 PM
8,Sun,October 26,Detroit Lions,Atlanta Falcons,9:30 AM
8,Mon,October 27,Washington Redskins,Dallas Cowboys,8:30 PM
9,Thu,October 30,New Orleans Saints,Carolina Panthers,8:25 PM
9,Sun,November 2,Jacksonville Jaguars,Cincinnati Bengals,1:00 PM
9,Sun,November 2,Tampa Bay Buccaneers,Cleveland Browns,1:00 PM
9,Sun,November 2,Arizona Cardinals,Dallas Cowboys,1:00 PM
9,Sun,November 2,Philadelphia Eagles,Houston Texans,1:00 PM
9,Sun,November 2,New York Jets,Kansas City Chiefs,1:00 PM
9,Sun,November 2,San Diego Chargers,Miami Dolphins,1:00 PM
9,Sun,November 2,Washington Redskins,Minnesota Vikings,1:00 PM
9,Sun,November 2,St. Louis Rams,San Francisco 49ers,4:05 PM
9,Sun,November 2,Denver Broncos,New England Patriots,4:25 PM
9,Sun,November 2,Oakland Raiders,Seattle Seahawks,4:25 PM
9,Sun,November 2,Baltimore Ravens,Pittsburgh Steelers,8:30 PM
9,Mon,November 3,Indianapolis Colts,New York Giants,8:30 PM
10,Thu,November 6,Cleveland Browns,Cincinnati Bengals,8:25 PM
10,Sun,November 9,Kansas City Chiefs,Buffalo Bills,1:00 PM
10,Sun,November 9,Miami Dolphins,Detroit Lions,1:00 PM
10,Sun,November 9,Dallas Cowboys,Jacksonville Jaguars,1:00 PM
10,Sun,November 9,San Francisco 49ers,New Orleans Saints,1:00 PM
10,Sun,November 9,Pittsburgh Steelers,New York Jets,1:00 PM
10,Sun,November 9,Tennessee Titans,Baltimore Ravens,1:00 PM
10,Sun,November 9,Atlanta Falcons,Tampa Bay Buccaneers,1:00 PM
10,Sun,November 9,Denver Broncos,Oakland Raiders,4:05 PM
10,Sun,November 9,St. Louis Rams,Arizona Cardinals,4:25 PM
10,Sun,November 9,New York Giants,Seattle Seahawks,4:25 PM
10,Sun,November 9,Chicago Bears,Green Bay Packers,8:30 PM
10,Mon,November 10,Carolina Panthers,Philadelphia Eagles,8:30 PM
11,Thu,November 13,Buffalo Bills,Miami Dolphins,8:25 PM
11,Sun,November 16,Atlanta Falcons,Carolina Panthers,1:00 PM
11,Sun,November 16,Minnesota Vikings,Chicago Bears,1:00 PM
11,Sun,November 16,Houston Texans,Cleveland Browns,1:00 PM
11,Sun,November 16,Philadelphia Eagles,Green Bay Packers,1:00 PM
11,Sun,November 16,Seattle Seahawks,Kansas City Chiefs,1:00 PM
11,Sun,November 16,Cincinnati Bengals,New Orleans Saints,1:00 PM
11,Sun,November 16,San Francisco 49ers,New York Giants,1:00 PM
11,Sun,November 16,Denver Broncos,St. Louis Rams,1:00 PM
11,Sun,November 16,Tampa Bay Buccaneers,Washington Redskins,1:00 PM
11,Sun,November 16,Oakland Raiders,San Diego Chargers,4:05 PM
11,Sun,November 16,Detroit Lions,Arizona Cardinals,4:25 PM
11,Sun,November 16,New England Patriots,Indianapolis Colts,8:30 PM
11,Mon,November 17,Pittsburgh Steelers,Tennessee Titans,8:30 PM
12,Thu,November 20,Kansas City Chiefs,Oakland Raiders,8:25 PM
12,Sun,November 23,Cleveland Browns,Atlanta Falcons,1:00 PM
12,Sun,November 23,New York Jets,Buffalo Bills,1:00 PM
12,Sun,November 23,Tampa Bay Buccaneers,Chicago Bears,1:00 PM
12,Sun,November 23,Jacksonville Jaguars,Indianapolis Colts,1:00 PM
12,Sun,November 23,Cincinnati Bengals,Houston Texans,1:00 PM
12,Sun,November 23,Green Bay Packers,Minnesota Vikings,1:00 PM
12,Sun,November 23,Detroit Lions,New England Patriots,1:00 PM
12,Sun,November 23,Tennessee Titans,Philadelphia Eagles,1:00 PM
12,Sun,November 23,St. Louis Rams,San Diego Chargers,4:05 PM
12,Sun,November 23,Arizona Cardinals,Seattle Seahawks,4:05 PM
12,Sun,November 23,Miami Dolphins,Denver Broncos,4:25 PM
12,Sun,November 23,Washington Redskins,San Francisco 49ers,4:25 PM
12,Sun,November 23,Dallas Cowboys,New York Giants,8:30 PM
12,Mon,November 24,Baltimore Ravens,New Orleans Saints,8:30 PM
13,Thu,November 27,Chicago Bears,Detroit Lions,12:30 PM
13,Thu,November 27,Philadelphia Eagles,Dallas Cowboys,4:30 PM
13,Thu,November 27,Seattle Seahawks,San Francisco 49ers,8:30 PM
13,Sun,November 30,Cleveland Browns,Buffalo Bills,1:00 PM
13,Sun,November 30,Washington Redskins,Indianapolis Colts,1:00 PM
13,Sun,November 30,Tennessee Titans,Houston Texans,1:00 PM
13,Sun,November 30,New York Giants,Jacksonville Jaguars,1:00 PM
13,Sun,November 30,Carolina Panthers,Minnesota Vikings,1:00 PM
13,Sun,November 30,New Orleans Saints,Pittsburgh Steelers,1:00 PM
13,Sun,November 30,Oakland Raiders,St. Louis Rams,1:00 PM
13,Sun,November 30,San Diego Chargers,Baltimore Ravens,1:00 PM
13,Sun,November 30,Cincinnati Bengals,Tampa Bay Buccaneers,1:00 PM
13,Sun,November 30,Arizona Cardinals,Atlanta Falcons,4:05 PM
13,Sun,November 30,New England Patriots,Green Bay Packers,4:25 PM
13,Sun,November 30,Denver Broncos,Kansas City Chiefs,8:30 PM
13,Mon,December 1,Miami Dolphins,New York Jets,8:30 PM
14,Thu,December 4,Dallas Cowboys,Chicago Bears,8:25 PM
14,Sun,December 7,Pittsburgh Steelers,Cincinnati Bengals,1:00 PM
14,Sun,December 7,Indianapolis Colts,Cleveland Browns,1:00 PM
14,Sun,December 7,Tampa Bay Buccaneers,Detroit Lions,1:00 PM
14,Sun,December 7,Houston Texans,Jacksonville Jaguars,1:00 PM
14,Sun,December 7,Baltimore Ravens,Miami Dolphins,1:00 PM
14,Sun,December 7,New York Jets,Minnesota Vikings,1:00 PM
14,Sun,December 7,Carolina Panthers,New Orleans Saints,1:00 PM
14,Sun,December 7,New York Giants,Tennessee Titans,1:00 PM
14,Sun,December 7,St. Louis Rams,Washington Redskins,1:00 PM
14,Sun,December 7,Kansas City Chiefs,Arizona Cardinals,4:05 PM
14,Sun,December 7,Buffalo Bills,Denver Broncos,4:05 PM
14,Sun,December 7,Seattle Seahawks,Philadelphia Eagles,4:25 PM
14,Sun,December 7,San Francisco 49ers,Oakland Raiders,4:25 PM
14,Sun,December 7,New England Patriots,San Diego Chargers,8:30 PM
14,Mon,December 8,Atlanta Falcons,Green Bay Packers,8:30 PM
15,Thu,December 11,Arizona Cardinals,St. Louis Rams,8:25 PM
15,Sun,December 14,Pittsburgh Steelers,Atlanta Falcons,1:00 PM
15,Sun,December 14,Green Bay Packers,Buffalo Bills,1:00 PM
15,Sun,December 14,Tampa Bay Buccaneers,Carolina Panthers,1:00 PM
15,Sun,December 14,Cincinnati Bengals,Cleveland Browns,1:00 PM
15,Sun,December 14,Houston Texans,Indianapolis Colts,1:00 PM
15,Sun,December 14,Minnesota Vikings,Detroit Lions,1:00 PM
15,Sun,December 14,Oakland Raiders,Kansas City Chiefs,1:00 PM
15,Sun,December 14,Miami Dolphins,New England Patriots,1:00 PM
15,Sun,December 14,Washington Redskins,New York Giants,1:00 PM
15,Sun,December 14,Jacksonville Jaguars,Baltimore Ravens,1:00 PM
15,Sun,December 14,New York Jets,Tennessee Titans,4:05 PM
15,Sun,December 14,Denver Broncos,San Diego Chargers,4:05 PM
15,Sun,December 14,San Francisco 49ers,Seattle Seahawks,4:25 PM
15,Sun,December 14,Dallas Cowboys,Philadelphia Eagles,8:30 PM
15,Mon,December 15,New Orleans Saints,Chicago Bears,8:30 PM
16,Thu,December 18,Tennessee Titans,Jacksonville Jaguars,8:25 PM
16,Sat,December 20,San Diego Chargers,San Francisco 49ers,4:30 PM
16,Sat,December 20,Philadelphia Eagles,Washington Redskins,4:30 PM
16,Sun,December 21,Cleveland Browns,Carolina Panthers,1:00 PM
16,Sun,December 21,Detroit Lions,Chicago Bears,1:00 PM
16,Sun,December 21,Baltimore Ravens,Houston Texans,1:00 PM
16,Sun,December 21,Minnesota Vikings,Miami Dolphins,1:00 PM
16,Sun,December 21,Atlanta Falcons,New Orleans Saints,1:00 PM
16,Sun,December 21,New England Patriots,New York Jets,1:00 PM
16,Sun,December 21,Kansas City Chiefs,Pittsburgh Steelers,1:00 PM
16,Sun,December 21,Green Bay Packers,Tampa Bay Buccaneers,1:00 PM
16,Sun,December 21,New York Giants,St. Louis Rams,4:05 PM
16,Sun,December 21,Indianapolis Colts,Dallas Cowboys,4:25 PM
16,Sun,December 21,Buffalo Bills,Oakland Raiders,4:25 PM
16,Sun,December 21,Seattle Seahawks,Arizona Cardinals,8:30 PM
16,Mon,December 22,Denver Broncos,Cincinnati Bengals,8:30 PM
17,Sun,December 28,Carolina Panthers,Atlanta Falcons,1:00 PM
17,Sun,December 28,Detroit Lions,Green Bay Packers,1:00 PM
17,Sun,December 28,Jacksonville Jaguars,Houston Texans,1:00 PM
17,Sun,December 28,San Diego Chargers,Kansas City Chiefs,1:00 PM
17,Sun,December 28,New York Jets,Miami Dolphins,1:00 PM
17,Sun,December 28,Chicago Bears,Minnesota Vikings,1:00 PM
17,Sun,December 28,Buffalo Bills,New England Patriots,1:00 PM
17,Sun,December 28,Philadelphia Eagles,New York Giants,1:00 PM
17,Sun,December 28,Indianapolis Colts,Tennessee Titans,1:00 PM
17,Sun,December 28,Cincinnati Bengals,Pittsburgh Steelers,1:00 PM
17,Sun,December 28,Cleveland Browns,Baltimore Ravens,1:00 PM
17,Sun,December 28,New Orleans Saints,Tampa Bay Buccaneers,1:00 PM
17,Sun,December 28,Dallas Cowboys,Washington Redskins,1:00 PM
17,Sun,December 28,Oakland Raiders,Denver Broncos,4:25 PM
17,Sun,December 28,St. Louis Rams,Seattle Seahawks,4:25 PM
17,Sun,December 28,Arizona Cardinals,San Francisco 49ers,4:25 PM"
array = []
season_array = []
game_array = []
temp = []
array = string.split("\n")
array.each do |game|
  game_array = game.split(",")
  game_array.delete_at(0)
  game_array.delete_at(0)
  temp = game_array[2].split(" ")
  if temp.length == 3
    temp.pop
    game_array << temp.join(" ")
  elsif temp.length == 2
    temp.pop
    game_array << temp.join(" ")
  end
  season_array << game_array
end

season_array.each do |game|
  if game[4] == "Minnesota"
    game[4] = "Minneapolis"
  elsif game[4] == "Carolina"
    game[4] = "Charlotte"
  elsif game[4] == "Tennessee"
    game[4] = "Nashville"
  elsif game[4] == "New England"
    game[4] = "Foxborough"
  elsif game[4] == "Arizona"
    game[4] = "Glendale"
  end
end

season_array.each do |team|
  if team[4] == "Baltimore"
    team << "MD"
    team << 21218
  elsif team[4] == "Cincinnati"
    team << "OH"
    team << 45214
  elsif team[4] == "Cleveland"
    team << "OH"
    team << 44109
  elsif team[4] == "Pittsburgh"
    team << "PA"
    team << 15210
  elsif team[4] == "Chicago"
    team << "IL"
    team << 60623
  elsif team[4] == "Detroit"
    team << "MI"
    team << 48227
  elsif team[4] == "Green Bay"
    team << "WI"
    team << 54301
  elsif team[4] == "Minneapolis"
    team << "MN"
    team << 55405
  elsif team[4] == "Houston"
    team << "TX"
    team << 77056
  elsif team[4] == "Indianapolis"
    team << "IN"
    team << 46204
  elsif team[4] == "Jacksonville"
    team << "FL"
    team << 32202
  elsif team[4] == "Nashville"
    team << "TN"
    team << 37201
  elsif team[4] == "Buffalo"
    team << "NY"
    team << 14127
  elsif team[4] == "Miami"
    team << "FL"
    team << 33010
  elsif team[4] == "Foxborough"
    team << "MA"
    team << 02035
  elsif team[4] == "New York"
    team << "NY"
    team << 10010
  elsif team[4] == "Denver"
    team << "CO"
    team << 80204
  elsif team[4] == "Kansas City"
    team << "MO"
    team << 64129
  elsif team[4] == "Oakland"
    team << "CA"
    team << 94621
  elsif team[4] == "San Diego"
    team << "CA"
    team << 92108
  elsif team[4] == "Atlanta"
    team << "GA"
    team << 30313
  elsif team[4] == "Charlotte"
    team << "NC"
    team << 28202
  elsif team[4] == "New Orleans"
    team << "LA"
    team << 70112
  elsif team[4] == "Tampa Bay"
    team << "FL"
    team << 33607
  elsif team[4] == "Dallas"
    team << "TX"
    team << 75032
  elsif team[4] == "Philadelphia"
    team << "PA"
    team << 19148
  elsif team[4] == "Washington"
    team[4] = "Landover"
    team << "MD"
    team << 20785
  elsif team[4] == "Glendale"
    team << "AZ"
    team << 85305
  elsif team[4] == "San Francisco"
    team[4] = "Santa Clara"
    team << "CA"
    team << 95050
  elsif team[4] == "Seattle"
    team << "WA"
    team << 98134
  elsif team[4] == "St. Louis"
    team << "MO"
    team << 63101
  end
end

season_array.each do |game|
  Football.create({
    date: game[0],
    home_team: game[1],
    away_team: game[2],
    time: game[3],
    city: game[4],
    state: game[5],
    zip: game[6]
    })
end
