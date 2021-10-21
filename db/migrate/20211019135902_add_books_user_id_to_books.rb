class AddBooksUserIdToBooks < ActiveRecord::Migration[5.2]
  def change
   add_column  :books_users_id, :integer
  end
end
