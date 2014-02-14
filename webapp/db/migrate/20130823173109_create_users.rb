class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
		t.string :username
		t.string :password
		t.string :gender
		t.string :birthdate
		t.string :email
      	t.string :password_digest
	t.timestamps
    end
  end
end
