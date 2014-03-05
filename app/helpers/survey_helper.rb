module SurveyHelper

	def my_total(array, attribute)
		array.inject(0) {|sum, hash| 
      ( hash[attribute] == nil ?  my_obj = 0 : my_obj = hash[attribute])
      sum + my_obj }
	end

end
