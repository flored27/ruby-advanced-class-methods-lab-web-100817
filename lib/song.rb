require 'pry'
class Song
  attr_accessor :name, :artist_name, :song_name

  @@all = []

  def initialize
    @@all << self
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
  end

  def self.create_by_name(song_name)
    song = Song.new_by_name(song_name)
    song.save
    song
  end

  def self.find_by_name(song)
    @@all.detect {|x| x.name == song}
  end

  def self.find_or_create_by_name(song_name)
    if song_name == nil
      song = song_name
      song
    elsif Song.find_by_name(song_name) == nil
      song = Song.create_by_name(song_name)
      song
    else
      song = Song.find_by_name(song_name)
      song
    end
  end

  def self.alphabetical
    (@@all.sort{|x,y| x.name <=> y.name}).uniq

  end

  def self.new_from_filename(file)
    new_song = self.new
    artist_name1 = file.split('-')[0].strip
    song_file = file.split('-')[1]
    new_song.name = song_file.split('.')[0].strip
    new_song.artist_name =artist_name1
    new_song
  end

  def self.create_from_filename(file)
    new_song = self.new
    artist_name1 = file.split('-')[0].strip
    song_file = file.split('-')[1]
    new_song.name = song_file.split('.')[0].strip
    new_song.artist_name =artist_name1
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

end
