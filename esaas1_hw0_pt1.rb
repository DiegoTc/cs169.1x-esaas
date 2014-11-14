# ESaaS 1
# HW 1 Part 1

def sum(array)
  array.empty? ? 0 : array.inject(:+)
end

def max_2_sum(array)
  return 0 unless !array.empty?
  return array[0] unless array.length > 1
  sum(array.sort!.reverse![0..1])  #array.sort!.reverse![0] + array[1]
end

def sum_to_n?(array, n)
  return false if array.length <= 1
  array.combination(2).each {|pair| return true if pair[0] + pair[1] == n}
  false
end

def test_suite
  edgecase = []
  nums = [0, 4, 9, 10, 2]
  one_num = [6]
  more_nums = [5, 3]
  raise "sum([]) != 0" unless sum(edgecase) == 0
  raise "sum([0, 4, 9, 10, 2] != 25" unless sum(nums) == 25
  raise "max_2_sum([]) != 0" unless max_2_sum(edgecase) == 0
  raise "max_2_sum([6]) != 6" unless max_2_sum(one_num) == 6
  raise "max_2_sum([0, 4, 9, 10, 2]) != 19" unless max_2_sum(nums) == 19
  raise "sum_to_n?([], 2) != false" unless sum_to_n?(edgecase, 2) == false
  raise "sum_to_n?([0, 4, 9, 10, 2], 13) != true" unless sum_to_n?(nums, 10) == true
  raise "sum_to_n?([5, 3], 10) != false" unless sum_to_n?(more_nums, 10) == false
  puts "All tests pass!"
end

# test_suite