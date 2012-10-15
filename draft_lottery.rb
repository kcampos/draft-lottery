#!/usr/bin/env ruby -wKU

@teams = []

# Populate draft lottery based on last years results
def input_teams
  print "How many teams in draft? " 
  num_teams = gets.strip.to_i
  
  puts "To determine seeding for draft please enter last years results..."
  
  (1..num_teams).each do |pick|
    print "Who finished in place #{pick}? "
    team = gets.strip
    pick.times { |team_seed| @teams << team }
  end
  
  puts "Draft Lottery: #{@teams}"
end

# Pick draft order
def select_picks 
  (1..@teams.uniq.size).each do |pick|
  
    unless(pick == 1)
      puts "Hit <enter> when ready to continue..."
      gets
    end
    
    # select team
    pick_team = @teams[rand(@teams.size)]
  
    # report team
    puts "*** #{pick} pick: #{pick_team} *** \n\n"
  
    # delete all entries for that team
    @teams.delete_if { |x| x == pick_team }

  end
  
  puts "Draft order is set...happy drafting!"
end

# Main
input_teams
select_picks