class AddBooksUserIdToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :books_user_id, :integer
  end
end
