require_relative '../test_helper'

class TestHomeController < Minitest::Unit::TestCase
  include Rack::Test::Methods

  def app
    GuessTheGem
  end

  def setup
    @jem_attr = {
      :name => 'Test Gem', 
      :downloads => 20,
      :version => "0.1.1",
      :platform => 'ruby',
      :authors => ["Marky Fletcher"],
      :info => "Gem for the test stuff",
      :dependencies => ["pry","try","dry"]
    }
    @jem = Jem.create!(@jem_attr)
  end

  def teardown
    @jem.destroy
  end

  def test_root_response
    get '/'
    assert last_response.ok?
  end

  def test_clue_response_valid_params
    get "/jems/#{@jem.id}/clues"
    assert last_response.ok?
  end

  def test_clue_response_invalid_params
    get "/jems/invalid/clues"
    assert last_response.ok?
    assert_equal 'Invalid ID', last_response.body
  end

  def test_not_found_response
    get '/noexist'
    assert_equal 404,last_response.status
  end

  def test_not_found_content
    get '/noexistalso'
    assert_includes last_response.body, 'The resource you were looking for could not be found.'
  end

  def test_js_response
    get '/main.js'
    assert last_response.ok?
  end

  def test_css_response
    get '/main.css'
    assert last_response.ok?
  end
end