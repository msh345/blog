helpers do

	class Hash
	  def has_blank?
	    self.values.any?{|v| v.nil? || v.length == 0}
	  end
	end

end
