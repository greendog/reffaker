#coding: utf-8

if Refinery::User.table_exists?
  puts "Creating an admin user..."

  Refinery::User.all.map { |c| c.destroy }

  admin = Refinery::User.create(:email => "admin@example.com", :username => "admin", :password => "password",
                                :password_confirmation => "password")

  admin.add_role(:refinery)
  admin.add_role(:superuser)
  admin.plugins = Refinery::Plugins.registered.in_menu.names

end
