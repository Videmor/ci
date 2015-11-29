class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :url, presence: true, uniqueness: true
  validates :description, length: { minimum: 5, maximum: 100}

  def change_state
    self.state = !self.state
  end

end
