#--> METADATA 
### 
Data Populate demo
Created by Hugo Magalhães

* Github - https://github.com/hugomagallanes
* Dribbble - https://dribbble.com/hugomagalhaes
* Twitter - https://twitter.com/hugopdmagalhaes
###

#-->_DEFAULTS

# Sets animation defaults
Framer.Defaults.Animation =
	curve: "bezier-curve"
	curveOptions: [0.65, 0, 1.35, 1.5]
	time: .75

#-->_DESIGN COMPONENTS AJUSTMENTS

# 1. Duration & Genre
# ↳ Sets "duration" to uppercase
comp_card.selectChild("duration").textTransform = "uppercase"

# ↳ Adjusts dot position depending on duration's length
comp_card.selectChild("dot").x = comp_card.selectChild("duration").maxX + 4
comp_card.selectChild("dot").y = 227

# ↳ Sets "genre" to uppercase
comp_card.selectChild("genre").textTransform = "uppercase"
comp_card.selectChild("genre").x = comp_card.selectChild("dot").maxX + 4



# # STEP 1 - GENERATING COMPONENTS
# 
# # Generate component built in Design tab
# card = comp_card.copy()
# card.name = "card"
# card.parent = mockup
# card.x = 20
# card.y = 104

# # STEP 2 - IMPORTING DATA FROM EXTERNAL JSON FILE 
# 
# # Imports external JSON file
# dataJSON = Utils.domLoadJSONSync("data/films.json")
# 
# # Generate component built in Design tab
# card = comp_card.copy()
# card.name = "card"
# card.parent = mockup
# card.x = 20
# card.y = 104
# 
# # Selects "thumbnail" element and fetches image from JSON file
# card.selectChild("thumbnail").image = dataJSON[0].screenshot
# 
# # Selects "title" text element and fetches title from JSON file
# card.selectChild("title").text = dataJSON[0].title

# # STEP 3 - USING LOOPS
# 
# # Imports external JSON file
# dataJSON = Utils.domLoadJSONSync("data/films.json")
# 
# # Generate component built in Design tab
# card = comp_card.copy()
# card.name = "card"
# card.parent = mockup
# card.x = 20
# card.y = 104
# 
# # Fetches data from JSON file
# card.selectChild("thumbnail").image = dataJSON[0].screenshot
# card.selectChild("title").text = dataJSON[0].title
# # ↳ More data fetching...
# card.selectChild("duration").text = dataJSON[0].duration
# card.selectChild("genre").text = dataJSON[0].genre
# card.selectChild("directorName").text = dataJSON[0].director.name
# card.selectChild("directorAvatar").image = dataJSON[0].director.avatar
# card.selectChild("actors").text = dataJSON[0].actors
# 
# # Let's find out this film's timetable
# # print dataJSON[0].sessions.length
#  
# # Stores number of sessions 
# numberOfSessions = dataJSON[0].sessions.length
# 
# # Creates a pill component based on the number of sessions
# for index in [0...numberOfSessions]
# 	time = comp_pill.copy()
# 	time.name = "time"
# 	time.parent = card
# 	time.x = 12
# 	time.y = 388
# 	
# 	# Fetches time from JSON file 	
# 	time.selectChild("duration").text = dataJSON[0].sessions[index]
# 	time.selectChild("duration").x = 12
# 
# 	# Adjusts component width dynamically 	
# 	time.width = time.width + 24
# 	time.x = 12 + (time.width * index)

# # STEP 4 - PLACING CARDS INSIDE A FULL-PAGE CAROUSEL
# 
# # Imports JSON file
# dataJSON = Utils.domLoadJSONSync("data/films.json")
# 
# # Creates a carousel component
# carousel = new PageComponent
# 	backgroundColor: "transparent"
# 	contentInset:
# 		right: 300
# 	height: Screen.height
# 	originX: 0
# 	parent: mockup
# 	scrollVertical: false
# 	width: Screen.width
# 	x: 0
# 	
# # Generates a card component in each slide of the carousel
# for index in [0...dataJSON.length]
# 
# 	# Creates a full-width slide
# 	slide = new Layer
# 		backgroundColor: "transparent"
# 		height: carousel.height
# 		parent: carousel.content
# 		width: 356
# 		x: ((carousel.width - 28) * index)
# 		
# 	# Generate a card component in each slide
# 	card = comp_card.copy()
# 	card.name = "card_0" + index
# 	card.parent = slide
# 	card.x = 20
# 	card.y = 104
# 	
# 	# Adds timetable components 	
# 	for delta in [0...dataJSON[index].sessions.length]
# 		time = comp_pill.copy()
# 		time.name = "time"
# 		time.parent = card
# 		time.x = 12
# 		time.y = 388
# 	
# 		# ↳ Fetches data from external JSON file	
# 		time.selectChild("duration").text = dataJSON[index].sessions[delta]
# 		time.selectChild("duration").x = 12
# 		# ↳ Dynamically adjust component's width based on content
# 		time.width = time.width + 24
# 		time.x = 12 + (time.width * delta)
# 		
# 	# Fetches data from external JSON file
# 	card.selectChild("thumbnail").image = dataJSON[index].screenshot
# 	card.selectChild("title").text = dataJSON[index].title
# 	card.selectChild("duration").text = dataJSON[index].duration
# 	card.selectChild("genre").text = dataJSON[index].genre
# 	card.selectChild("directorName").text = dataJSON[index].director.name
# 	card.selectChild("directorAvatar").image = dataJSON[index].director.avatar
# 	card.selectChild("actors").text = dataJSON[index].actors
	
# # STEP 5 - ADDING EXTRA FEATURES
# 
# # Stores indicator dots 
# dotsArr = []
# 
# # Imports JSON file
# dataJSON = Utils.domLoadJSONSync("data/films.json")
# 
# # Creates a carousel component
# carousel = new PageComponent
# 	backgroundColor: "transparent"
# 	contentInset:
# 		right: 300
# 	height: Screen.height
# 	originX: 0
# 	parent: mockup
# 	scrollVertical: false
# 	width: Screen.width
# 	x: 0
# 	
# # Creates a container to hold the indicator dots   
# indicators = new Layer
# 	backgroundColor: "transparent"
# 	height: 8
# 	parent: mockup
# 	x: Align.center
# 	y: 604
# 	
# # Generates a card component in each slide of the carousel
# for index in [0...dataJSON.length]
# 
# 	# Creates a full-width slide
# 	slide = new Layer
# 		backgroundColor: "transparent"
# 		height: carousel.height
# 		parent: carousel.content
# 		width: 356
# 		x: ((carousel.width - 28) * index)
# 		
# 	# Generate a card component in each slide
# 	card = comp_card.copy()
# 	card.name = "card_0" + index
# 	card.parent = slide
# 	card.x = 20
# 	card.y = 104
# 	
# 	# Adds timetable components 	
# 	for delta in [0...dataJSON[index].sessions.length]
# 		time = comp_pill.copy()
# 		time.name = "time"
# 		time.parent = card
# 		time.x = 12
# 		time.y = 388
# 	
# 		# ↳ Fetches data from external JSON file	
# 		time.selectChild("duration").text = dataJSON[index].sessions[delta]
# 		time.selectChild("duration").x = 12
# 		# ↳ Dynamically adjust component's width based on content
# 		time.width = time.width + 24
# 		time.x = 12 + (time.width * delta)
# 		
# 	# Fetches data from external JSON file
# 	card.selectChild("thumbnail").image = dataJSON[index].screenshot
# 	card.selectChild("title").text = dataJSON[index].title
# 	card.selectChild("duration").text = dataJSON[index].duration
# 	card.selectChild("genre").text = dataJSON[index].genre
# 	card.selectChild("directorName").text = dataJSON[index].director.name
# 	card.selectChild("directorAvatar").image = dataJSON[index].director.avatar
# 	card.selectChild("actors").text = dataJSON[index].actors
# 	
# 	# Adds "new" component to card component
# 	nouveau = comp_new.copy()
# 	nouveau.name = "nouveau"
# 	nouveau.parent = card
# 	nouveau.x = 12
# 	nouveau.y = 12
# 	#  ↳ Only show "new" if listed as new in JSON file 	
# 	if dataJSON[index].new is false
# 		nouveau.opacity = 0
# 
# 	
# 	
# 	# Creates indicator dots
# 	dot = new Layer
# 		backgroundColor: "#444444"
# 		borderRadius: "100%"
# 		name: "dot_0" + index
# 		parent: indicators
# 		size: 8
# 	# ↳ Dynamically distributes them 	
# 	dot.x = (dot.width + 6) * index
# 	
# 	# ↳ Adds an "active" state to the dot element 	
# 	dot.states =
# 		active:
# 			backgroundColor: "white"
# 
# 	# ↳ Push dot elements to array 	
# 	dotsArr.push(dot)
# 	
# 	
# # Re-center indicators container based on the number of cards
# indicators.width = dotsArr[dotsArr.length-1].maxX
# indicators.x = Align.center
# 
# 
# 
# 
# # Sets defaults for the 1st slide 
# mockup.selectChild("background_IMG").image = dataJSON[0].screenshot
# dotsArr[0].states.switch("active")
# 
# 
# # Event: Do the following commands when the user swipes to another page 
# carousel.on "change:currentPage", ->
# 
# 	# ↳ Store slide index 	
# 	slideIndex = carousel.horizontalPageIndex(carousel.currentPage)
# 
# 	# ↳ Change background IMG based on slide index
# 	mockup.selectChild("background_IMG").image = dataJSON[slideIndex].screenshot
# 
# 	# ↳ Switch indicator dots 	
# 	layer.states.switch("default") for layer in dotsArr
# 	dotsArr[slideIndex].states.switch("active")










#-->_CLEAR DESIGN TAB

# Stores all design tab components 
designTabComp = [comp_pill, comp_card, comp_new]

# Destroy all design tab components 
for layer in designTabComp
	layer.destroy()




