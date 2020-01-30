require('pry')
require_relative('../models/student')
require_relative('../models/house')

Student.delete_all()
House.delete_all()

gryffindor = House.new({
  'name' =>'Gryffindor'});
gryffindor.save()

slytherin = House.new({
  'name' =>'Slytherin'});
slytherin.save()

hufflepuff = House.new({
  'name' =>'Hufflepuff'});
hufflepuff.save()

ravenclaw = House.new({
  'name' =>'Ravenclaw'});
ravenclaw.save()


harry = Student.new({
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'age' => 11,
  'house' => gryffindor.id
  });
harry.save()

hermione = Student.new({
  'first_name' => 'Hermione',
  'last_name' => 'Granger',
  'age' => 10,
  'house' => gryffindor.id
  });
hermione.save()

draco = Student.new({
  'first_name' => 'Draco',
  'last_name' => 'Malfoy',
  'age' => 13,
  'house' => slytherin.id
  });
draco.save()

binding.pry
nil
