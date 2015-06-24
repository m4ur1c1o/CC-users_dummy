class User < ActiveRecord::Base
  # ej. User.authenticate('fernando@codea.mx', 'qwerty')

  def self.authenticate(email, password)
		return nil unless user = User.find_by(email: email)

		# if !user == nil
			if user.password == password
		    # si el email y el password corresponden a un usuario valido, regresa el usuario
		    # de otra manera regresa nil
		    user
		  else
		  	nil
		  end
		# else
		# 	nil
		end
  # end

  
end