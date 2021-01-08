class Palindrome < ApplicationRecord
  validates :value, presence: true, uniqueness: true
  before_create :create_array
  def get_resulte
    ActiveSupport::JSON.decode(res)
  end

  private
  def create_array
    @res = []
    (0..value.to_i).each do |x|
      @res << [x, x.to_s(2)] if x.to_s.reverse.to_i == x.to_i and x.to_s(2) == x.to_s(2).reverse
    end
    self.res = ActiveSupport::JSON.encode(@res)
  end
end
