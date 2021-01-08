require 'test_helper'

class PalindromeTest < ActiveSupport::TestCase
    test 'test create and get result ' do
      assert_equal '[[0,"0"],[1,"1"],[3,"11"]]', Palindrome.where(value: 4).first_or_create.res
    end

    test 'test different results' do
      assert_not_equal Palindrome.where(value: 100).first_or_create.res, Palindrome.where(value: 4).first_or_create.res
    end

    test 'test < 0 value' do
      assert_equal "[]", Palindrome.where(value: -10).first_or_create.res
    end

    test 'test find result' do
      Palindrome.where(value: 4).create
      assert_not_nil  Palindrome.find_by_value 4
    end

    test 'add only unique params' do
      assert_nil  Palindrome.find_by_value 4
      Palindrome.where(value: 4).create
      Palindrome.where(value: 4).create
      assert_not_nil  Palindrome.find_by_value 4
      Palindrome.find_by_value(4).destroy
      assert_nil  Palindrome.find_by_value 4
    end
end
