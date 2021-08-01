class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def add_tax
    (self.price * 1.1).round.to_s(:delimited)
  end

end
