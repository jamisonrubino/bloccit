class AddSponsoredPostToComments < ActiveRecord::Migration
  def change
    add_column :comments, :sponsored_post_id, :integer
  end
end
