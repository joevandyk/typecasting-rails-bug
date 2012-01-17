class Product < ActiveRecord::Base
  def quantity *args, &block
    # In my app, sometimes I'm not just returning the
    # quantity from the table, sometimes I look it up
    # from other sources.  But just redefining the method
    # shows the bug.

    read_attribute :quantity # read_attribute should return the value after type-casting.
  end
end
