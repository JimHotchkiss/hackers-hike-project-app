#user_info = [ #uername, #email, #password
#  ["John Muir", "johnmuir@gmail.come", "johnmuir"],
#  ["Bob Smith", "bobsmith@gamil.com", "bobsmilth"],
#  ["Larry Jones", "larryjones@gmail.com", "larryjones"]
#]

#user_info.each do |username, email, password|
#  User.create(username: username, email: email, password: password)
#end

Difficulty.create(rank: "Easy")
Difficulty.create(rank: "Mildly Challenging")
Difficulty.create(rank: "Challenging")
Difficulty.create(rank: "Hard")
Difficulty.create(rank: "Experts Only!")


#hike_info = [ #name, locaiton, descitpion, user_id, category_id
#  ['Dipey Trail', 'Stinson Beach, CA', 'Many different vistas', '3', '2'],
#  ['Deer Park', 'Fairfax, CA', 'Open and wooded paths', '2', '1'],
#  ['Devils Gulch', 'Woodacre, CA', 'This woods', '3', '3'],
#  ['Tennessee Valley', 'Mill Valley, CA', 'Wide open coastal views', '1', '2'],
#]

#hike_info.each do |name, location, description, user_id, category_id|
#  Hike.create(name: name, location: location, description: description, user_id: user_id, category_id: category_id)
#end
