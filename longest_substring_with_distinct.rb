# Problem statement:
# Given a string of characters, write a function that finds the longest substring that contains only two unique characters.

# Example:
# Input: "abcbbbbcccbdddadacb"
# Output: "bcbbbbcccb"

# Explanation:
# In the given input string, the longest substring that contains only two unique characters is "bcbbbbcccb", which contains the characters 'b' and 'c' only.

# Constraints:
# - The input string will have at least one character.
# - The input string can have any combination of uppercase and lowercase letters, spaces, and special characters.
# - The output substring should be of maximum length.
# - If there are multiple substrings of the same maximum length, return any one of them.


def longest_unique_substring_memoize str
  return str if str.length <= 2
  len = str.length
  memoize = Array.new(len+1) { Array.new(len+1) }

  #setup memoize
  memoize[0][0] = ''

  j = 1
  while j <= len
    memoize[0][j] = ''
    j += 1
  end

  j = 1
  while j <= len
    memoize[j][0] = ''
    j += 1
  end
  #setup middle cells

  i = 1
  while i <= len
    memoize[i][i] = str[i-1]
    i+=1
  end

  j = 2
  i = 1

  # puts memoize.inspect

  while i < len+1
    while j < len+1
      memoize[i][j] = if str[i-1..j-1].split('').uniq.length > 2
        find_string_with_max_lenght([memoize[i][j-1], memoize[i-1][j]])
      else
        find_string_with_max_lenght([str[i-1..j-1], memoize[i][j-1], memoize[i-1][j]])
      end
      j +=1
    end
    i += 1
    j = i+1
  end

  return memoize[len-1][len]
end

def find_string_with_max_lenght arr
  arr.sort_by { |str| str.length }.last
end


puts longest_unique_substring_memoize 'a'
puts longest_unique_substring_memoize 'aasa'
puts longest_unique_substring_memoize 'abcbbbbcccbdddadacb'
puts longest_unique_substring_memoize 'aabbcc'
