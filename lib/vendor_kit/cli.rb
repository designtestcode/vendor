module VendorKit

  module CLI

    # This reload method kinda works. It works if you change/add methods, but if you
    # remove methods from a class, they still seem to hang around. I believe there is
    # a fair amount of magic in rails that lets you call a reload!, but for the save
    # of VendorKit development, this will suffice.
    def self.reload!
      begin
        old_verbose, $VERBOSE = $VERBOSE, nil
        $".grep(/\/lib\/vendor_kit/).each {|e| $".delete(e) && require(e) }
      ensure
        $VERBOSE = old_verbose
      end
      "Reloaded!"
    end

  end

end
