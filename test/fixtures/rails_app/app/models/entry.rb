=begin

  This model is not enabled in typus but is used to test things things like:

    - Single Table Inheritance

=end

class Entry < ActiveRecord::Base

  has_and_belongs_to_many :categories

end
