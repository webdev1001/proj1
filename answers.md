# Q0: Why is this error being thrown?

- Needs a Pokemon model, to create pokemon. Otherwise @pokemon is left uninitialized.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *

- The sample method randomly chooses an element from an array. When we go to the home page, we get routed to the index action of the home controller, which gets an array of uncaptured pkmn (trainer:nil) and calls sample on that array. The common factor is that they are uncaptured (haz trainer field = nil).

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.

- Creates a button with the text "Throw a Pokeball!". The capture_path(...) portion specifies the path that the request will be redirected. It takes in an id of the captured pokemon as a parameter so that when we get the request, we can update the database accordingly (in the capture method of Pokemons controller). The :class ... is part of html_options and specifies the class of the button for css styling. :method specifies the form of the method; we are doing an update here so we use the PATCH http verb.

# Question 3: What would you name your own Pokemon?

Same name but all lowercase

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?

- I passed damage_path(id: d) into redirect_to, where d is a pokemon object. The damage_path helper creates a path from that.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.

- In appliction.html.erb there is a line that renders /layout/messages, which renders the file messages.html.erb. The messages.html.erb file has code that takes the flash array we filled with messages and loops through it to displa the associated messages. Since application.html.erb is default for rendering any page it will be used when we submit the form

# Give us feedback on the project and decal below!

Project was fun. Rain into problem where trainer names weren't displaying in trainers#index, after reseting db. Turns out that we need to restart server after resetingg db.

# Extra credit: Link your Heroku deployed app
