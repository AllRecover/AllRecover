class AddConfirmableToDevise < ActiveRecord::Migration
  def change
    # add_column :users, :confirmation_token, :string
    # add_column :users, :confirmed_at, :datetime
    # add_column :users, :confirmation_sent_at, :datetime
    # # add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
    # add_index :users, :confirmation_token, unique: true
    #
    # User.all.update_all confirmed_at: DateTime.now
  end
end
