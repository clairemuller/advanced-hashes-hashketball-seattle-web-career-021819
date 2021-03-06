require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson": {
          number: "0",
          shoe: "16",
          points: "22",
          rebounds: "12",
          assists: "12",
          steals: "3",
          blocks: "1",
          slam_dunks: "1"
        },
        "Reggie Evans": {
          number: "30",
          shoe: "14",
          points: "12",
          rebounds: "12",
          assists: "12",
          steals: "12",
          blocks: "12",
          slam_dunks: "7"
        },
        "Brook Lopez": {
          number: "11",
          shoe: "17",
          points: "17",
          rebounds: "19",
          assists: "10",
          steals: "3",
          blocks: "1",
          slam_dunks: "15"
        },
        "Mason Plumlee": {
          number: "1",
          shoe: "19",
          points: "26",
          rebounds: "12",
          assists: "6",
          steals: "3",
          blocks: "8",
          slam_dunks: "5"
        },
        "Jason Terry": {
          number: "31",
          shoe: "15",
          points: "19",
          rebounds: "2",
          assists: "2",
          steals: "4",
          blocks: "11",
          slam_dunks: "1"
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien": {
          number: "4",
          shoe: "18",
          points: "10",
          rebounds: "1",
          assists: "1",
          steals: "2",
          blocks: "7",
          slam_dunks: "2"
        },
        "Bismak Biyombo": {
          number: "0",
          shoe: "16",
          points: "12",
          rebounds: "4",
          assists: "7",
          steals: "7",
          blocks: "15",
          slam_dunks: "10"
        },
        "DeSagna Diop": {
          number: "2",
          shoe: "14",
          points: "24",
          rebounds: "12",
          assists: "12",
          steals: "4",
          blocks: "5",
          slam_dunks: "5"
        },
        "Ben Gordon": {
          number: "8",
          shoe: "15",
          points: "33",
          rebounds: "3",
          assists: "2",
          steals: "1",
          blocks: "1",
          slam_dunks: "0"
        },
        "Brendan Haywood": {
          number: "33",
          shoe: "15",
          points: "6",
          rebounds: "12",
          assists: "12",
          steals: "22",
          blocks: "5",
          slam_dunks: "12"
        }
      }
    }
  }
end


def num_points_scored(players_name)
  points = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, values|
          if name.to_s == players_name
            values.each do |k, v|
              if k == :points
                points = v
              end
            end
          end
        end
      end
    end
  end
  points.to_i
end

def shoe_size(players_name)
  shoe_size = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, values|
          if name.to_s == players_name
            values.each do |k, v|
              if k == :shoe
                shoe_size = v
              end
            end
          end
        end
      end
    end
  end
  shoe_size.to_i
end


def team_colors(team_name)
  team_colors = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        team_colors << game_hash.fetch(location).fetch(:colors)
      end
    end
  end
  team_colors.flatten
end


def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_names << game_hash.fetch(location).fetch(:team_name)
  end
  team_names
end


def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        team_data.each do |attribute, data|
          if attribute == :players
            data.each do |name, stats|
              numbers << stats[:number].to_i
            end
          end
        end
      end
    end
  end
  numbers
end


def player_stats(players_name)
  player_stats = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name.to_s == players_name
            stats.each do |k, v|
              player_stats[k] = v.to_i
            end
          end
        end
      end
    end
  end
  player_stats
end


def big_shoe_rebounds
  shoe_sizes_w_names = {}

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          stats.each do |k, v|
            if k == :shoe
              shoe_sizes_w_names[name] = v
            end
          end
        end
      end
    end
  end

  player_w_big_shoes = shoe_sizes_w_names.key(shoe_sizes_w_names.values.max)

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == player_w_big_shoes
            stats.each do |k, v|
              if k == :rebounds
                return v.to_i
              end
            end
          end
        end
      end
    end
  end
end
