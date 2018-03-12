# Rocky is a runner and his coach gives him a track with numbered posts to run on.
# We want to get the most visited post. So say the track is 5 posts long, and
# the coach gives him a schedule to run [2,4,1,3]. This means he starts at post 2,
# runs to 4, runs back to 1, then runs to 3. Below represents his sprint with tallies
# every time he visits a post:
#   1   2   3   4   5
#       x   x   x      ( 2 to 4 )
#   x   x   x   x      ( 4 to 1 )
#   x   x   x          ( 1 to 3 )
#
# The most visited posts are 2 and 3. We will return the lowest #'d post in this case (2).

module Track
  def self.getMostVisited(posts, sprints)
  visits = Hash.new(0)
  if (posts <= 0 || sprints.empty?) # Should return an error message indiciating there is no "most visited," will return 0 for now
    return 0
  end
  sprints.each_with_index do |position, index|
    if(index == sprints.length-1) # If we're at the last position, we have nowhere to run to. Break out of loop.
      break
    end
    nextPosition = sprints[index+1].to_i # Get the next running position
    # If Rocky is "running backwards," i.e. going from position 9 to 4, switch the
    # positions for the upcoming loop so it's 1) readable and 2) we don't have to deal with weird negatives
    if nextPosition < position
      firstPosition = nextPosition
      nextPosition = position
    else
      firstPosition = position
    end
    (firstPosition...nextPosition).each do |f|
      visits[f] += 1 # Add to the number of visits for each position in his sprint
    end
  end
  return visits.sort.to_h.key(visits.values.max) # Return the lowest visit key with the highest value
  end
end

puts Track.getMostVisited(5, [2,4,1,3]) # Should return 2
puts Track.getMostVisited(9, [4,9,1,3]) # Should return 1
puts Track.getMostVisited(0, [1,2,3]) # Should return 0
puts Track.getMostVisited(100, []) # Should return 0
puts Track.getMostVisited(20, [1,15,3,19,3]) # Should return 3
