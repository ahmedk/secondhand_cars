#create brands
makes = [{:name => "BMW"},
         {:name => "Volkes Wagen"},
         {:name => "Toyota"},
         {:name => "Opel"},
         {:name => "Hyundai"},
         {:name => "Kia"}]
makes.each do |make|
  Make.create! make
end

#create models
models = [{:name => "X3", :make_id => 1},
          {:name => "i320", :make_id => 1},
          {:name => "Passat", :make_id => 2},
          {:name => "Yares", :make_id => 3},
          {:name => "Astra", :make_id => 4},
          {:name => "Vectra", :make_id => 4},
          {:name => "Elantra", :make_id => 5},
          {:name => "Cerato", :make_id => 6}]
models.each do |car_model|
  CarModel.create! car_model
end

#create owners
owners = [{:name => "Adam Samir", :email => "asamir@hotmail.com", :phone => "22345455", :mobile => "01232453765"},
          {:name => "Mohamed Ali", :email => "moh_ali23@yahoo.com", :phone => "33483728", :mobile => "01028448430"},
          {:name => "Mahmoud Osama", :email => "mahmoud.osama@gmail.com", :phone => "29573758", :mobile => "01247386016"},
          {:name => "Alaa Maged", :email => "a.maged@live.com", :phone => "352618904", :mobile => "01134860173"}]
owners.each do |owner|
  Owner.create! owner
end

#create cars
cars = [{:description => "A/T fairly new", :price => 350000, :year => 2013, :seats => 4, :doors => 4, :car_model_id => 2, :owner_id => 1},
        {:description => "M/T good shape", :price => 350000, :year => 2012, :seats => 4, :car_model_id => 4, :owner_id => 2},
        {:description => "Good shape, barely used", :price => 350000, :year => 2008, :car_model_id => 6, :owner_id => 3},
        {:description => "please call for details", :price => 350000, :year => 2012, :seats => 4, :doors => 4, :car_model_id => 8, :owner_id => 4}]
cars.each do |car|
  Car.create! car
end

#create users
users = [{:owner_id => 1, :password => "12345", :password_confirmation => "12345"},
         {:owner_id => 2, :password => "12345", :password_confirmation => "12345"},
         {:owner_id => 3, :password => "12345", :password_confirmation => "12345"},
         {:owner_id => 4, :password => "12345", :password_confirmation => "12345"}]
users.each do |usr|
  User.create! usr
end
