require 'test_helper'

class TestIntegration < ActionDispatch::IntegrationTest
  test 'Redirect to Login Pagw' do
    get palindrome_input_url
    assert_response 302
    follow_redirect!
    assert_select 'h1', 'Вход'
end
  test 'Sign in and Login' do
    post '/users', params: {user: {name: '123',email: '123@gmail.com' ,password: '123',password_confirmation: '123'}}
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', 'Вы вошли как 123 Выйти'
  end
end
 
