class Utility
  def self.double_chack_passowrd(password, password2)
    bol = false
    if password == password2
      bol = true
    end
    bol
  end
end
