require 'json'

class Spotify
  def initialize
    @input_data = JSON.parse(File.read("./#{ARGV[0]}"))
    @changes_data = JSON.parse(File.read("./#{ARGV[1]}"))

    @song_ids = @input_data['songs'].map { |s| s['id'] }
    @user_ids = @input_data['users'].map { |s| s['id'] }
  end

  def update_playlist
    @changes_data['update_playlist'].each do |data|
      playlist =  @input_data['playlists'].detect { |p| p["id"] == data["playlist_id"] }
      return if playlist.nil?

      if !(playlist['song_ids'].include?(data['song_id'])) && @song_ids.include?(data['song_id'])
        playlist['song_ids'].push data['song_id']
      end
    end
    puts 'Updates Successful!'
  end

  def create_playlist
    @changes_data['new_playlist'].each do |data|
      if @user_ids.include?(data['owner_id'])
        @input_data['playlists'].push({
          "id"=>"#{@input_data['playlists'].last['id'].to_i + 1}",
          "owner_id"=>"#{data['owner_id']}",
          "song_ids"=>data['song_ids']
        })
      end
    end
    puts 'Creation Successful!'
  end

  def delete_playlist
    @changes_data['remove_playlist'].each do |data|
      @input_data['playlists'].each_with_index do |playlist, i|
        @input_data['playlists'].delete_at(i) if playlist['id'] == data['id']
      end
    end
    puts 'Deletion Successful!'
  end

  def write_changes
    File.write("./#{ARGV[2]}", JSON.dump(@input_data))
    puts 'Changes Implemented Successfully!'
  end
end

def apply_spotify_changes
  spotify = Spotify.new

  spotify.update_playlist
  spotify.create_playlist
  spotify.delete_playlist

  spotify.write_changes
end

apply_spotify_changes
