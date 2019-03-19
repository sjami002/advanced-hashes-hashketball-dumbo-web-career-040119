# require "pry"
# # Write your code here!

def game_hash

  game_hash = {
    :home => {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },

    :away => {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }

game_hash
end


# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
#
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#       end
#     end
#   end
# end
#
# good_practices

def num_points_scored(playername)
  points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == playername
            stats.each do |stat, value|
              if stat == :points
                points = value
              end
            end
          end
        end
      end
    end
  end
  points
end


def shoe_size(playername)
  size = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == playername
            stats.each do |stat, value|
              if stat == :shoe
                size = value
              end
            end
          end
        end
      end
    end
  end
  size
end


def team_colors(teamname)
  color = []
  if game_hash[:home][:team_name] == teamname
    color = game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == teamname
    color = game_hash[:away][:colors]
  else
    puts "This team is not in the game."
end
  color
end



def team_names
  array = []
  game_hash.each do |location, team_data|
    team_data.each do |data, name|
      if data == :team_name
        array << name
      end
    end
  end
      array
end



def player_numbers(teamname)
  jerseys=[]
  if game_hash[:home][:team_name]==teamname
      game_hash[:home].each do |attribute,data|
        if attribute == :players
          data.each do |names,stats|
            stats.each do |stat,value|
                if stat == :number
                  jerseys << value
                end
              end
            end
          end
        end
  elsif game_hash[:away][:team_name]==teamname
    game_hash[:away].each do |attribute,data|
      if attribute == :players
        data.each do |names,stats|
          stats.each do |stat,value|
              if stat == :number
                jerseys << value
              end
            end
          end
        end
      end
  else
    puts "That team is not in this game."
  end
  jerseys
end

def player_stats(playername)
  stats = {}
  if game_hash[:home][:players].keys.include?(playername)
    stats = game_hash[:home][:players][playername]
  elsif game_hash[:away][:players].keys.include?(playername)
    stats = game_hash[:away][:players][playername]
  else
    puts "Player is not in the game."
end
stats
end



def big_shoe_rebounds
  paired_array = []
  sliced_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          stats.each do |stat, value|
            if stat == :shoe
              paired_array << value
            end
            if stat == :rebounds
              paired_array << value
            end
          end
        end
      end
    end
  end
  paired_array

  sliced_array = paired_array.each_slice(2).to_a
  sliced_array.sort!
  sliced_array.flatten!
  sliced_array[-1]
end
