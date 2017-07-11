class User < ActiveRecord::Base
    has_many :posts
    
    before_save { self.email = email.downcase if email.present? }
    before_save { self.role ||= :member }

    before_save :format_name
    
    validates :name, length: { minimum: 1, maximum: 100 }, presence: true
 # #4
    validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
    validates :password, length: { minimum: 6 }, allow_blank: true
 # #5
    validates :email,
        presence: true,
        uniqueness: { case_sensitive: false },
        length: { minimum: 3, maximum: 254 }

    has_secure_password
   
   enum role: [:member, :admin]
   
    def format_name
        self.name = name.split.map{|n| n.capitalize}.join(" ") if name
    end
end
