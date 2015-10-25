class AddOauthToUsers < ActiveRecord::Migration
  def change
	  change_table :users do |t|
		  t.string :oauth_token
		  t.string :oauth_secret
	  end
  end
end
