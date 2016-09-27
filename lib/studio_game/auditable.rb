module StudioGame
  module Auditable
    def audit
      puts "\nRolled a #{self.number} (#{self.class})"
    end
  end
end
