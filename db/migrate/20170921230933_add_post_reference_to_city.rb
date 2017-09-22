class AddPostReferenceToCity < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :city, index: true, foreign_key: true
  end
end
