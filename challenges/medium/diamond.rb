class Diamond
  def self.make_diamond(let)
    return "A\n" if let == 'A'

    spaces = ' '
    arr = ['A']
    ('B'..let).each do |l|
      arr << "#{l}#{spaces}#{l}"
      spaces << (' ' * 2)
    end

    (arr += arr[0...-1].reverse)
    arr.map! { |str| str.center(arr.size) }
    "#{arr.join("\n")}\n"
  end
end

#   PROBLEM:
#       INPUT: letter
#       OUTPUT: diamond composed of matched letter lines
#
#   Examples:
#     - return single 'A' if `A` is suppelied
#     - return string, output nothing
#     - all upcase, don't worry about lower
#
#   DATA: strings, array of strings to store each line
#   ALgo:
#         return A if A
#         iterate from (b..let)
#         variable for spaces incremented
#         add string to arr of strings
#         return joined array

me = Diamond.make_diamond('E')
p me
