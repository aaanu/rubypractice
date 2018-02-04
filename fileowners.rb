# group_by_owners should
# - accept a hash containing the file owner name for each file name
# - returns a hash containing an array of file names for each owner name, in any order
# ex: {'Input.txt' => 'Randy', 'Code.py' => 'Stan', 'Output.txt' => 'Randy'}
# returns
# {'Randy' => ['Input.txt', 'Output.txt'], 'Stan' => ['Code.py']}

module FileOwners
  def self.group_by_owners(files)
    h = Hash.new { |hash, key| hash[key] = [] } #hash values are now arrays
    files.each_with_object(h) { |(key, value), hash| hash[value] << key } #these arrays accumulate the files based on old hash's values
  end
end

# given example / various files
files_1 = {
  'Input.txt' => 'Randy',
  'Code.py' => 'Stan',
  'Output.txt' => 'Randy'
}
puts FileOwners.group_by_owners(files_1)

# each owner has a single file
files_2 = {
  'Test.txt' => 'Shannon',
  'Random.py' => 'Becky'
}

puts FileOwners.group_by_owners(files_2)
