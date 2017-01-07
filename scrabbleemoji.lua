#!/usr/bin/env lua

local input = table.concat( arg, " ", 1, #arg)

local printScrabble = function()
  local increaseTheHell = false
  local stdEmoji = {
    a = "a",
    b = "b",
    c = "copyright",
    d = "bow_and_arrow",
    e = "e-mail",
    f = "checkered_flag",
    g = "fuelpump",
    h = "love_hotel",
    i = "information_source",
    j = "hot_pepper",
    k = "tanabata_tree",
    l = "boot",
    m = "m",
    n = "construction",
    o = "o",
    p = "parking",
    q = "left_speech_bubble",
    r = "registered",
    s = "heavy_dollar_sign",
    t = "latin_cross",
    u = "ophiuchus",
    v = "aries",
    w = "open_hands",
    x = "heavy_multiplication_x",
    y = "seedling",
    z = "zzz"
  }
  local outputTable = {}
  local toInsert = ""
  for letter in input:gmatch(".") do
    if letter:find("%s") then --space
      if increaseTheHell then
        toInsert = ":white_large_square:"
      else
        toInsert = ":ltr-blank:"
      end
    elseif letter:find("%a") then --letter
      if increaseTheHell then
        toInsert = ":" .. stdEmoji[letter:lower()] .. ":"
      else
        toInsert = ":ltr-" .. letter:lower() .. ":"
      end
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
    v= 4,
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

if arg[#arg] == "--points" then printPoints()
else printScrabble() end
