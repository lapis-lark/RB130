=begin
  PROBLEM:
    #verse:
      IN: integer
      OUT: verse (STR) with the appropriate number of beer bottles;
            special verses for 0 and 1
    #verses
      print verses from (upper -> lower)
    #lyrics
      verses(99, 0)

  EXAMPLES:
    

  DATA:
    STRINGS, INTS

  ALGO:
    #verse
      print string with argument (n) substituted
    #verses(upper, lower)
      from upper to lower, verse(i)
    #lyrics
      verse(99, 0)
=end

class BeerSong
  def self.verse(b)
    if b == 1 
      "#{b} bottle of beer on the wall, #{b} bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif b == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

    elsif b == 2
      "#{b} bottles of beer on the wall, #{b} bottles of beer.\n" \
      "Take one down and pass it around, #{b - 1} bottle of beer on the wall.\n"
    else
      "#{b} bottles of beer on the wall, #{b} bottles of beer.\n" \
      "Take one down and pass it around, #{b - 1} bottles of beer on the wall.\n"
    end
  end

  def self.verses(upper, lower)
    lines = ''
    upper.downto(lower) do |n| 
      line = self.verse(n)
      line << "\n" unless n == lower
      lines << line
    end
    lines
  end

  def self.lyrics
    self.verses(99, 0)
  end
end

puts BeerSong.verses(9, 1)