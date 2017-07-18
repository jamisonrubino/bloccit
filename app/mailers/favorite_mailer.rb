class FavoriteMailer < ApplicationMailer
    default from: "jamison.rubino@gmail.com"
    def new_comment(user, post, comment)
        headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
        headers["References"] = "<post/#{post.id}@your-app-name.example>"
 
        @user = user
        @post = post
        @comment = comment
 
        mail(to: user.email, subject: "New comment on #{post.title}")
    end
    
    def new_post(user, post)
        Favorite.new(post: post)
        flash[:notice] = "Your post was created and favorited. You will be notified of comments by email."
 
        headers["Post-ID"] = "<post/#{post.id}@your-app-name.example>"
        headers["References"] = "<post/#{post.id}@your-app-name.example>"

        @user = user
        @post = post

        mail(to: user.email, subject: "New post created and favorited.")
    end
end