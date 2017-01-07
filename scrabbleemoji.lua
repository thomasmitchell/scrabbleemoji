#!/usr/bin/env lua


local printScrabble = function()
  local outputTable = {}
  local toInsert = ""
  for letter in input:gmatch(".") do
    if letter:find("%s") then --space
      toInsert = ":ltr-blank:" 
    elseif letter:find("%a") then --letter
      toInsert = ":ltr-" .. letter:lower() .. ":" 
    elseif letter:find("?") then --question mark
      toInsert = ":question-block:"
    elseif letter:find("!") then --exclamation
      toInsert = ":exclamation:"
    else --if its something else
      toInsert = letter
    end
    table.insert( outputTable, toInsert)
  end

  io.write(table.concat( outputTable, " ", 1, #outputTable ))
  print()
end

local printPoints = function()
  local values = {
    a = 1,
    b = 3,
    c = 3,
    d = 2,
    e = 1,
    f = 4,
    g = 2,
    h = 4,
    i = 1,
    j = 8,
    k = 5,
    l = 1,
    m = 3,
    n = 1,
    o = 1,
    p = 3,
    q = 10,
    r = 1,
    s = 1,
    t = 1,
    u = 1,
    v = 4,
    w = 4,
    x = 8,
    y = 4,
    z = 10,
  }
  local total = 0
  for letter in input:gmatch("%a") do
    total = total + values[letter]
  end
  print(total)
end

if arg[#arg] == "--points" then 
  input = table.concat( arg, " ", 1, #arg - 1):lower()
  printPoints()
else 
  input = table.concat( arg, " ", 1, #arg)
  printScrabble() 
end