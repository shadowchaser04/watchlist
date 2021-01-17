#!/usr/bin/env ruby
require File.expand_path('../../config/environment', __FILE__)
require 'pry'
require 'json'

# options hash
opt = {name: "please provide movie name:>",
       note: "please provide note:>",
       tags: "please add comma seperated tags:>"}

# NOTE: There is a search method in the movie models. Movie.search("") it
# searches within the notes.

class Movielist

  def initialize(name, note)
    @name = name
    @note = note

    self.create
  end

  def create
    Movie.find_or_create_by(name: @name, note: @note)
  end

  def all_tags(tag)
    m = Movie.find_by(name: @name)
    m.tags = tag.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end


end

#------------------------------------------------------------------------------
# simple movies
#------------------------------------------------------------------------------

puts opt[:name]

# get the name of the movie
name = gets.chomp

puts opt[:note]

# get the movie notes
note = gets.chomp

puts opt[:tags]

# get the movie notes
tags = gets.chomp

watch = Movielist.new(name, note)

watch.all_tags(tags)
