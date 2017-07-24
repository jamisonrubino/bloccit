module UsersHelper
    def posts_or_comments(type)
        unless %w(comments posts).include? type && @user.send(type)
            @user.send(type) ? "<h2>#{type.capitalize}</h2>".html_safe : "<h2>#{@user.name} has not submitted any #{type} yet.</h2>".html_safe
        end
    end
end
