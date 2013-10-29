class Employee < ActiveRecord::Base
	#before_create :modify_name
  attr_accessible :age, :division, :fname, :lname 
  validates :fname, length: { minimum: 5 }
  validates :lname, :presence => true
  validates :age, :presence => true
  validates :division, :presence => true

end

#def modify_name
#	self.name = self.fname + " " + self.lname 
	
#end


#def check_age
 # 	if self.age >18
  #		return true
  #	else
  #		return false
  	
  #end
#end




#end

