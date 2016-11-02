require 'test_helper'

class QuerysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @craft = crafts(:test_ship)
  end

  test "query should lookup craft" do
    query = "{craft(id: #{@craft.id}) {id, name}}"
    get '/query', params: { query: query }
    assert_response :success

    expected_response = {
      data: {
        craft: {
          id: @craft.id.to_s,
          name: @craft.name,
        }
      }
    }
    actual_response = JSON.parse(response.body).deep_symbolize_keys

    assert_equal expected_response, actual_response
  end

  test "empty query should return useful error" do
    query = ''
    get '/query', params: { query: query }
    assert_response 404
    expected_response = { error: 'No query supplied' }
    actual_response = JSON.parse(response.body).deep_symbolize_keys

    assert_equal expected_response, actual_response
  end

  test "no query should return useful error" do
    get '/query'
    assert_response 404
    expected_response = { error: 'No query supplied' }
    actual_response = JSON.parse(response.body).deep_symbolize_keys

    assert_equal expected_response, actual_response
  end
end
