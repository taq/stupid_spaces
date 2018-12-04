require 'test_helper'
require 'active_record'

ActiveRecord::Base.establish_connection({
  adapter:  'sqlite3',
  database: "#{Dir.pwd}/test/stupid_spaces.sqlite3",
})

class Person < ActiveRecord::Base
  include StupidSpaces
end

class StupidSpacesTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::StupidSpaces::VERSION
  end

  def test_strip_after_attribuition
    person = Person.new
    person.name = '     John Lennon   '
    assert_equal person.name, 'John Lennon'
  end

  def test_strip_after_update_attribute
    person = Person.first
    person.update_attribute(:name, '     Paul McCartney   ')
    assert_equal person.name, 'Paul McCartney'
  end

  def test_strip_after_update_attributes
    person = Person.first
    person.update_attributes(name: '     George Harrison   ')
    assert_equal person.name, 'George Harrison'
  end

  def test_strip_after_creating
    person = Person.create(name: '     George Martin   ')
    assert_equal person.name, 'George Martin'
  end
end
