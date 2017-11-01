# user class additional information
class Userinfo
  attr_reader :name_surname, :username, :password
  def initialize(name_surname, username, password)
    @name_surname = name_surname
    @username = username
    @password = password
  end
end
