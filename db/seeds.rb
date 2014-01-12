c = Committee.create({
  :name => "Meals on Wheels",
  :description => "Preparing meals to be delivered to seniors who are homebound.",
  :location => "Dining Hall Kitchen" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 10,
    :start_time => "9:00",
    :end_time => "13:00" })


c = Committee.create({
  :name => "Bag Lunches",
  :description => "Assembling lunch bags for our guests.",
  :location => "Athletic Center Lobby" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 10,
    :start_time => "9:30",
    :end_time => "12:00" })


c = Committee.create({
  :name => "Clothing Drive",
  :description => "Assist in sorting and moving clothing donations.",
  :location => "Athletic Center Lobby" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 12,
    :start_time => "10:00",
    :end_time => "15:00" })


c = Committee.create({
  :name => "Book Drive",
  :description => "Moving and sorting books donated for our guests.",
  :location => "Athletic Center Lobby" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 15,
    :start_time => "11:00",
    :end_time => "16:00" })


c = Committee.create({
  :name => "Food Drive",
  :description => "Help transport donations to and help at local food bank.",
  :location => "Dining Hall Landing" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 10,
    :start_time => "10:00",
    :end_time => "12:00" })


c = Committee.create({
  :name => "Thrift Store",
  :description => "Help transport donations to Greater Goods and help at store.",
  :location => "Athletic Center Lobby" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 12,
    :start_time => "9:45",
    :end_time => "12:15" })

  Shift.create({
    :position => 2,
    :committee_id => c.id,
    :capacity => 12,
    :start_time => "11:45",
    :end_time => "14:15" })


c = Committee.create({
  :name => "Carnival Set-Up",
  :description => "Help set up games and supplies in the Field House.",
  :location => "Athletic Center Gym" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 15,
    :start_time => "9:00",
    :end_time => "12:00" })


c = Committee.create({
  :name => "Carnival",
  :description => "Students will be assigned games or inflatables to run at Carnival for guests.",
  :location => "Athletic Center Gym" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 33,
    :start_time => "11:00",
    :end_time => "13:30" })

  Shift.create({
    :position => 2,
    :committee_id => c.id,
    :capacity => 33,
    :start_time => "13:00",
    :end_time => "16:00" })


c = Committee.create({
  :name => "Arts and Crafts",
  :description => "Students will be assigned to various tables to help guests with crafts.",
  :location => "Athletic Center Gym" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 27,
    :start_time => "12:00",
    :end_time => "14:00" })

  Shift.create({
    :position => 2,
    :committee_id => c.id,
    :capacity => 27,
    :start_time => "14:00",
    :end_time => "16:00" })


c = Committee.create({
  :name => "Book Nook",
  :description => "Students will read books to guests.",
  :location => "Athletic Center Gym" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 2,
    :start_time => "11:30",
    :end_time => "13:30" })

  Shift.create({
    :position => 2,
    :committee_id => c.id,
    :capacity => 2,
    :start_time => "13:30",
    :end_time => "15:30" })


c = Committee.create({
  :name => "Sports Equipment",
  :description => "Students will help collect and sort donated equipment.",
  :location => "Dining Hall Landing" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 6,
    :start_time => "13:00",
    :end_time => "15:00" })


c = Committee.create({
  :name => "Greeters",
  :description => "Students will greet and guide guests to Carnival.",
  :location => "Athletic Center -- Pool Entrance" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 10,
    :start_time => "11:30",
    :end_time => "13:45" })

  Shift.create({
    :position => 2,
    :committee_id => c.id,
    :capacity => 10,
    :start_time => "13:30",
    :end_time => "16:00" })


c = Committee.create({
  :name => "Greeters (Spanish Speaking)",
  :description => "Students will greet and direct guests to Carnival. Must be fluent in Spanish. May be asked to act as interpreters.",
  :location => "Athletic Center -- Pool Entrance" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 4,
    :start_time => "11:30",
    :end_time => "13:45" })

  Shift.create({
    :position => 2,
    :committee_id => c.id,
    :capacity => 4,
    :start_time => "13:30",
    :end_time => "16:00" })


c = Committee.create({
  :name => "Refreshments",
  :description => "Students will help prepare and serve refreshments to guests.",
  :location => "Athletic Center Gym" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 10,
    :start_time => "11:30",
    :end_time => "13:30" })

  Shift.create({
    :position => 2,
    :committee_id => c.id,
    :capacity => 10,
    :start_time => "13:30",
    :end_time => "15:30" })


c = Committee.create({
  :name => "Senior Center",
  :description => "Students will go to Assisted Living facility to meet with residents.",
  :location => "Athletic Center Command Central" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 24,
    :start_time => "13:15",
    :end_time => "15:45" })


c = Committee.create({
  :name => "Blood Drive",
  :description => "Students will assist with signing in donors.  Blood Drive volunteers will need to go to a training during DMX on Thursday, Jan 24.",
  :location => "Science Center Lobby" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 6,
    :start_time => "8:00",
    :end_time => "11:00" })

  Shift.create({
    :position => 2,
    :committee_id => c.id,
    :capacity => 6,
    :start_time => "11:00",
    :end_time => "13:00" })

  Shift.create({
    :position => 3,
    :committee_id => c.id,
    :capacity => 6,
    :start_time => "13:00",
    :end_time => "16:00" })


c = Committee.create({
  :name => "Alternates/Command Central",
  :description => "Students will be assigned as needed at Carnival and other activities.",
  :location => "Athletic Center Command Central" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 8,
    :start_time => "10:00",
    :end_time => "12:00" })

  Shift.create({
    :position => 2,
    :committee_id => c.id,
    :capacity => 8,
    :start_time => "12:00",
    :end_time => "14:00" })

  Shift.create({
    :position => 3,
    :committee_id => c.id,
    :capacity => 8,
    :start_time => "14:00",
    :end_time => "16:00" })


c = Committee.create({
  :name => "Clean Up Crew",
  :description => "Students will help sweep, clean up trash, dismantle Carnival games, etc.",
  :location => "Athletic Center Gym" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 8,
    :start_time => "15:00",
    :end_time => "17:00" })


c = Committee.create({
  :name => "Computer Command Center",
  :description => "Students will check in volunteers using online attendance system.",
  :location => "Athletic Center" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 2,
    :start_time => "8:00",
    :end_time => "12:30" })

  Shift.create({
    :position => 2,
    :committee_id => c.id,
    :capacity => 2,
    :start_time => "12:00",
    :end_time => "16:00" })


c = Committee.create({
  :name => "Origami Table",
  :description => "Students will teach guests how to do origami. There will be a training session before Community Day.",
  :location => "Athletic Center" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 4,
    :start_time => "12:00",
    :end_time => "14:00" })

  Shift.create({
    :position => 2,
    :committee_id => c.id,
    :capacity => 4,
    :start_time => "14:00",
    :end_time => "16:00" })


c = Committee.create({
  :name => "Family Helpers",
  :description => "Students will act as helpers for families at the Carnival.",
  :location => "Athletic Center" })

  Shift.create({
    :position => 1,
    :committee_id => c.id,
    :capacity => 4,
    :start_time => "12:00",
    :end_time => "14:00" })

  Shift.create({
    :position => 2,
    :committee_id => c.id,
    :capacity => 4,
    :start_time => "14:00",
    :end_time => "16:00" })