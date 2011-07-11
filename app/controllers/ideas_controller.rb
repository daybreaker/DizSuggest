class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
    if (request.xhr?)
      render :layout => false
    end
  end

  def show
    @idea = Idea.find(params[:id])
    if (request.xhr?)
      render :layout => false
    end
  end
  
  def new
    @idea = Idea.new
    @attractions = Hash.new
    @types = $types
    @locations = $locations
 #   @locations.each_key{|x| @attractions[x] = Attraction.find_all_for_location(x)}
  end

  def create
    @idea = Idea.new(params[:idea])
    @idea.tag_list = params[:idea][:tag_list]
    @idea.submitter_id = current_user.id
    
    if @idea.save
      redirect_to ideas_url, :notice => "Successfully created idea."
    else
      render :action => 'new'
    end
  end

  def edit
    @idea = Idea.find(params[:id])
    @attractions = Hash.new
    @types = $types
    @locations = $locations
 #   @locations.each_key{|x| @attractions[x] = Attraction.find_all_for_location(x)}
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.tag_list = params[:idea][:tag_list]
    
    if @idea.update_attributes(params[:idea])
      redirect_to ideas_url, :notice  => "Successfully updated idea."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to ideas_url, :notice => "Successfully destroyed idea."
  end
  
  def upvote
    idea = Idea.find(params[:id])
    current_user.vote_exclusively_for(idea)
    render :nothing => true

  end
  
  def downvote
    idea = Idea.find(params[:id])
    current_user.vote_exclusively_against(idea)
    render :nothing => true
  end
  
  def new_comment
    @idea = Idea.find(params[:id])
    @parent_id = (!params[:comment].blank?) ? params[:comment] : false;
    render :layout => false
  end
  
  def create_comment
    @idea = Idea.find(params[:id])
    comment = Comment.build_from(@idea, current_user.id, params[:comment])
    comment.save
    comment.move_to_child_of(Comment.find(params[:parent_id])) if !params[:parent_id].blank?
    redirect_to idea_path(@idea)
  end
    
end


=begin
require 'open-uri'
require 'json'

locations = %w(magic-kingdom epcot animal-kingdom hollywood-studios)
types = %w(dining attractions)

url = "http://touringplans.com/"


#urls = %w(http://touringplans.com/magic-kingdom/attractions http://touringplans.com/magic-kingdom/dining http://touringplans.com/walt-disney-world/resort-dining http://touringplans.com/walt-disney-world/hotels)
attractions = {}

locations.each do |loc|
  attractions[loc] = {}
  types.each do |type|
    attractions[loc][type] = JSON.parse(open(url + loc + '/' + type + '.json').read)
  end
end

#results for dining is array of arrays, split into table vs quick
result_show = JSON.parse(open(urls[1] + '/' + result[0][1]['permalink'] +'.json').read)



{"magic-kingdom"=>{"dining"=>[[{"permalink"=>"caseys-corner", "name"=>"Casey's Corner"}, {"permalink"=>"columbia-harbor-house", "name"=>"Columbia Harbor House"}, {"permalink"=>"cosmic-rays-starlight-cafe", "name"=>"Cosmic Ray's Starlight Cafe"}, {"permalink"=>"diamond-horseshoe", "name"=>"Diamond Horseshoe"}, {"permalink"=>"golden-oak-outpost", "name"=>"Golden Oak Outpost"}, {"permalink"=>"pecos-bill-tall-tale-inn-and-cafe", "name"=>"Pecos Bill Tall Tale Inn and Cafe"}, {"permalink"=>"pinocchio-village-haus", "name"=>"Pinocchio Village Haus"}, {"permalink"=>"storybook-treats", "name"=>"Storybook Treats"}, {"permalink"=>"lunching-pad", "name"=>"The Lunching Pad"}, {"permalink"=>"tomorrowland-terrace-cafe", "name"=>"Tomorrowland Terrace Cafe"}, {"permalink"=>"tortuga-tavern", "name"=>"Tortuga Tavern"}], [{"permalink"=>"cinderellas-royal-table", "name"=>"Cinderella's Royal Table"}, {"permalink"=>"liberty-tree-tavern", "name"=>"Liberty Tree Tavern"}, {"permalink"=>"crystal-palace", "name"=>"The Crystal Palace"}, {"permalink"=>"plaza-restaurant", "name"=>"The Plaza Restaurant"}, {"permalink"=>"tonys-town-square-restaurant", "name"=>"Tony's Town Square Restaurant"}]], "attractions"=>[{"permalink"=>"astro-orbiter", "name"=>"Astro Orbiter", "short_name"=>"Astro Orbiter"}, {"permalink"=>"big-thunder-mountain-railroad", "name"=>"Big Thunder Mountain Railroad", "short_name"=>"Big Thunder Mountain"}, {"permalink"=>"buzz-lightyears-space-ranger-spin", "name"=>"Buzz Lightyear's Space Ranger Spin", "short_name"=>"Buzz Lightyear"}, {"permalink"=>"country-bear-jamboree", "name"=>"Country Bear Jamboree", "short_name"=>"Country Bear Jamboree"}, {"permalink"=>"dumbo-the-flying-elephant", "name"=>"Dumbo the Flying Elephant", "short_name"=>"Dumbo"}, {"permalink"=>"its-a-small-world", "name"=>"it's a small world", "short_name"=>"it's a small world"}, {"permalink"=>"jungle-cruise", "name"=>"Jungle Cruise", "short_name"=>"Jungle Cruise"}, {"permalink"=>"liberty-square-riverboat", "name"=>"Liberty Square Riverboat", "short_name"=>"Liberty Square Riverboat"}, {"permalink"=>"mad-tea-party", "name"=>"Mad Tea Party", "short_name"=>"Mad Tea Party"}, {"permalink"=>"mickeys-philharmagic", "name"=>"Mickey's PhilharMagic", "short_name"=>"Mickey's PhilharMagic"}, {"permalink"=>"monsters-inc-laugh-floor", "name"=>"Monsters, Inc. Laugh Floor", "short_name"=>"Laugh Floor"}, {"permalink"=>"peter-pans-flight", "name"=>"Peter Pan's Flight", "short_name"=>"Peter Pan's Flight"}, {"permalink"=>"pirates-of-the-caribbean", "name"=>"Pirates of the Caribbean", "short_name"=>"Pirates of the Caribbean"}, {"permalink"=>"prince-charming-regal-carrousel", "name"=>"Prince Charming Regal Carrousel", "short_name"=>"Regal Carrousel"}, {"permalink"=>"snow-whites-scary-adventures", "name"=>"Snow White's Scary Adventures", "short_name"=>"Snow White"}, {"permalink"=>"space-mountain", "name"=>"Space Mountain", "short_name"=>"Space Mountain"}, {"permalink"=>"splash-mountain", "name"=>"Splash Mountain", "short_name"=>"Splash Mountain"}, {"permalink"=>"stitchs-great-escape", "name"=>"Stitch's Great Escape", "short_name"=>"Stitch's Great Escape"}, {"permalink"=>"swiss-family-treehouse", "name"=>"Swiss Family Treehouse", "short_name"=>"Swiss Family Treehouse"}, {"permalink"=>"enchanted-tiki-room-under-new-management", "name"=>"The Enchanted Tiki Room - Under New Management!", "short_name"=>"Enchanted Tiki Room"}, {"permalink"=>"hall-of-presidents", "name"=>"The Hall of Presidents", "short_name"=>"Hall of Presidents"}, {"permalink"=>"haunted-mansion", "name"=>"The Haunted Mansion", "short_name"=>"Haunted Mansion"}, {"permalink"=>"magic-carpets-of-aladdin", "name"=>"The Magic Carpets of Aladdin", "short_name"=>"Magic Carpets of Aladdin"}, {"permalink"=>"many-adventures-of-winnie-the-pooh", "name"=>"The Many Adventures of Winnie the Pooh", "short_name"=>"Winnie the Pooh"}, {"permalink"=>"tom-sawyer-island", "name"=>"Tom Sawyer Island", "short_name"=>"Tom Sawyer Island"}, {"permalink"=>"tomorrowland-speedway", "name"=>"Tomorrowland Speedway", "short_name"=>"Tomorrowland Speedway"}, {"permalink"=>"tomorrowland-transit-authority-peoplemover", "name"=>"Tomorrowland Transit Authority PeopleMover", "short_name"=>"PeopleMover"}, {"permalink"=>"town-square-theater-mickey-mouse", "name"=>"Town Square Theater Mickey Mouse Meet and Greet", "short_name"=>"Town Square Mickey"}, {"permalink"=>"town-square-theater-princesses", "name"=>"Town Square Theater Princess Meet and Greet", "short_name"=>"Town Square Princesses"}, {"permalink"=>"walt-disney-world-railroad-frontierland-station", "name"=>"Walt Disney World Railroad Frontierland Station", "short_name"=>"Railroad Frontierland"}, {"permalink"=>"walt-disney-world-railroad-main-street-usa-station", "name"=>"Walt Disney World Railroad Main Street U.S.A. Station", "short_name"=>"Railroad Main Street"}, {"permalink"=>"walt-disneys-carousel-of-progress", "name"=>"Walt Disney's Carousel of Progress", "short_name"=>"Carousel of Progress"}]}, "epcot"=>{"dining"=>[[{"permalink"=>"africa-coolpost-refreshment-outpost", "name"=>"Africa Coolpost/Refreshment Outpost"}, {"permalink"=>"boulangerie-patisserie", "name"=>"Boulangerie Patisserie"}, {"permalink"=>"crepes-des-chefs-de-france", "name"=>"Crepes des Chefs de France"}, {"permalink"=>"electric-umbrella-restaurant", "name"=>"Electric Umbrella Restaurant"}, {"permalink"=>"fife-and-drum-tavern", "name"=>"Fife and Drum Tavern"}, {"permalink"=>"kringla-bakeri-og-kafe", "name"=>"Kringla Bakeri og Kafe"}, {"permalink"=>"la-cantina-de-san-angel", "name"=>"La Cantina de San Angel"}, {"permalink"=>"liberty-inn", "name"=>"Liberty Inn"}, {"permalink"=>"lotus-blossom-cafe", "name"=>"Lotus Blossom Cafe"}, {"permalink"=>"promenade-refreshments", "name"=>"Promenade Refreshments"}, {"permalink"=>"refreshment-port", "name"=>"Refreshment Port"}, {"permalink"=>"rose-and-crown-pub", "name"=>"Rose and Crown Pub"}, {"permalink"=>"sommerfest", "name"=>"Sommerfest"}, {"permalink"=>"sunshine-seasons-food-fair", "name"=>"Sunshine Seasons Food Fair"}, {"permalink"=>"tangierine-cafe", "name"=>"Tangierine Cafe"}, {"permalink"=>"yakitori-house", "name"=>"Yakitori House"}, {"permalink"=>"yorkshire-county-fish-shop", "name"=>"Yorkshire County Fish Shop"}], [{"permalink"=>"akershus-royal-banquet-hall", "name"=>"Akershus Royal Banquet Hall"}, {"permalink"=>"biergarten", "name"=>"Biergarten"}, {"permalink"=>"bistro-de-paris", "name"=>"Bistro de Paris"}, {"permalink"=>"coral-reef-restaurant", "name"=>"Coral Reef Restaurant"}, {"permalink"=>"la-hacienda-de-san-angel", "name"=>"La Hacienda de San Angel"}, {"permalink"=>"le-cellier-steakhouse", "name"=>"Le Cellier Steakhouse"}, {"permalink"=>"les-chefs-de-france", "name"=>"Les Chefs de France"}, {"permalink"=>"nine-dragons-restaurant", "name"=>"Nine Dragons Restaurant"}, {"permalink"=>"restaurant-marrakesh", "name"=>"Restaurant Marrakesh"}, {"permalink"=>"rose-and-crown-dining-room", "name"=>"Rose and Crown Dining Room"}, {"permalink"=>"san-angel-inn", "name"=>"San Angel Inn"}, {"permalink"=>"teppan-edo", "name"=>"Teppan Edo"}, {"permalink"=>"garden-grill-restaurant", "name"=>"The Garden Grill Restaurant"}, {"permalink"=>"tokyo-dining", "name"=>"Tokyo Dining"}, {"permalink"=>"tutto-italia-ristorante", "name"=>"Tutto Italia Ristorante"}, {"permalink"=>"via-napoli", "name"=>"Via Napoli"}]], "attractions"=>[{"permalink"=>"ellens-energy-adventure", "name"=>"Ellen's Energy Adventure", "short_name"=>"Ellen's Energy Adventure"}, {"permalink"=>"gran-fiesta-tour-starring-the-three-caballeros", "name"=>"Gran Fiesta Tour Starring The Three Caballeros", "short_name"=>"Gran Fiesta Tour"}, {"permalink"=>"illuminations-reflections-of-earth", "name"=>"IllumiNations: Reflections of Earth", "short_name"=>"IllumiNations"}, {"permalink"=>"impressions-de-france", "name"=>"Impressions de France", "short_name"=>"Impressions de France"}, {"permalink"=>"innoventions-east", "name"=>"Innoventions East", "short_name"=>"Innoventions East"}, {"permalink"=>"innoventions-west", "name"=>"Innoventions West", "short_name"=>"Innoventions West"}, {"permalink"=>"journey-into-imagination-with-figment", "name"=>"Journey into Imagination with Figment", "short_name"=>"Journey into Imagination"}, {"permalink"=>"living-with-the-land", "name"=>"Living with the Land", "short_name"=>"Living with the Land"}, {"permalink"=>"maelstrom", "name"=>"Maelstrom", "short_name"=>"Maelstrom"}, {"permalink"=>"mission-space-green", "name"=>"Mission: Space Green", "short_name"=>"Mission: Space Green"}, {"permalink"=>"mission-space-orange", "name"=>"Mission: Space Orange", "short_name"=>"Mission: Space Orange"}, {"permalink"=>"o-canada", "name"=>"O Canada!", "short_name"=>"O Canada!"}, {"permalink"=>"reflections-of-china", "name"=>"Reflections of China", "short_name"=>"Reflections of China"}, {"permalink"=>"soarin", "name"=>"Soarin'", "short_name"=>"Soarin'"}, {"permalink"=>"spaceship-earth", "name"=>"Spaceship Earth", "short_name"=>"Spaceship Earth"}, {"permalink"=>"sum-of-all-thrills", "name"=>"Sum of All Thrills", "short_name"=>"Sum of All Thrills"}, {"permalink"=>"test-track", "name"=>"Test Track", "short_name"=>"Test Track"}, {"permalink"=>"american-adventure", "name"=>"The American Adventure", "short_name"=>"American Adventure"}, {"permalink"=>"circle-of-life", "name"=>"The Circle of Life", "short_name"=>"Circle of Life"}, {"permalink"=>"seas-with-nemo-friends", "name"=>"The Seas with Nemo & Friends", "short_name"=>"Seas with Nemo"}, {"permalink"=>"turtle-talk-with-crush", "name"=>"Turtle Talk with Crush", "short_name"=>"Turtle Talk with Crush"}]}, "animal-kingdom"=>{"dining"=>[[{"permalink"=>"flame-tree-barbecue", "name"=>"Flame Tree Barbecue"}, {"permalink"=>"kusafiri-coffee-shop", "name"=>"Kusafiri Coffee Shop"}, {"permalink"=>"picnic-in-the-park", "name"=>"Picnic in the Park"}, {"permalink"=>"pizzafari", "name"=>"Pizzafari"}, {"permalink"=>"restaurantosaurus", "name"=>"Restaurantosaurus"}, {"permalink"=>"royal-anandapur-tea-company", "name"=>"Royal Anandapur Tea Company"}, {"permalink"=>"tamu-tamu", "name"=>"Tamu Tamu"}, {"permalink"=>"yak-and-yeti-local-food-cafe", "name"=>"Yak and Yeti Local Food Cafe"}], [{"permalink"=>"rainforest-cafe-animal-kingdom", "name"=>"Rainforest Cafe - Animal Kingdom"}, {"permalink"=>"tusker-house-restaurant", "name"=>"Tusker House Restaurant"}, {"permalink"=>"yak-yeti-restaurant", "name"=>"Yak & Yeti Restaurant"}]], "attractions"=>[{"permalink"=>"conservation-station", "name"=>"Conservation Station", "short_name"=>"Conservation Station"}, {"permalink"=>"dinosaur", "name"=>"Dinosaur", "short_name"=>"Dinosaur"}, {"permalink"=>"expedition-everest", "name"=>"Expedition Everest", "short_name"=>"Expedition Everest"}, {"permalink"=>"festival-of-the-lion-king", "name"=>"Festival of the Lion King", "short_name"=>"Festival of the Lion King"}, {"permalink"=>"finding-nemo-the-musical", "name"=>"Finding Nemo: The Musical", "short_name"=>"Finding Nemo: Musical"}, {"permalink"=>"flights-of-wonder", "name"=>"Flights of Wonder", "short_name"=>"Flights of Wonder"}, {"permalink"=>"tough-to-be-a-bug", "name"=>"It's Tough to Be a Bug!", "short_name"=>"It's Tough to Be a Bug"}, {"permalink"=>"kali-river-rapids", "name"=>"Kali River Rapids", "short_name"=>"Kali River Rapids"}, {"permalink"=>"kilimanjaro-safaris", "name"=>"Kilimanjaro Safaris", "short_name"=>"Kilimanjaro Safaris"}, {"permalink"=>"maharajah-jungle-trek", "name"=>"Maharajah Jungle Trek", "short_name"=>"Maharajah Jungle Trek"}, {"permalink"=>"pangani-forest-exploration-trail", "name"=>"Pangani Forest Exploration Trail", "short_name"=>"Pangani Forest Trail"}, {"permalink"=>"primeval-whirl", "name"=>"Primeval Whirl", "short_name"=>"Primeval Whirl"}, {"permalink"=>"boneyard", "name"=>"The Boneyard", "short_name"=>"The Boneyard"}, {"permalink"=>"triceratop-spin", "name"=>"TriceraTop Spin", "short_name"=>"TriceraTop Spin"}, {"permalink"=>"wildlife-express-train-africa-station", "name"=>"Wildlife Express Train: Africa Station", "short_name"=>"Wildlife Express: Africa"}, {"permalink"=>"wildlife-express-train-rafikis-planet-watch-station", "name"=>"Wildlife Express Train: Rafiki's Planet Watch Station", "short_name"=>"Wildlife Express: RPW"}]}, "hollywood-studios"=>{"dining"=>[[{"permalink"=>"abc-commissary", "name"=>"ABC Commissary"}, {"permalink"=>"backlot-express", "name"=>"Backlot Express"}, {"permalink"=>"catalina-eddies", "name"=>"Catalina Eddie's"}, {"permalink"=>"fairfax-fare", "name"=>"Fairfax Fare"}, {"permalink"=>"min-and-bills-dockside-diner", "name"=>"Min and Bill's Dockside Diner"}, {"permalink"=>"rosies-all-american-cafe", "name"=>"Rosie's All American Cafe"}, {"permalink"=>"starring-rolls-cafe", "name"=>"Starring Rolls Cafe"}, {"permalink"=>"studio-catering-co", "name"=>"Studio Catering Co."}, {"permalink"=>"toluca-legs-turkey-co", "name"=>"Toluca Legs Turkey Co"}, {"permalink"=>"toy-story-pizza-planet", "name"=>"Toy Story Pizza Planet"}], [{"permalink"=>"50s-prime-time-cafe", "name"=>"50's Prime Time Cafe"}, {"permalink"=>"hollywood-and-vine", "name"=>"Hollywood and Vine"}, {"permalink"=>"mama-melroses-ristorante-italiano", "name"=>"Mama Melrose's Ristorante Italiano"}, {"permalink"=>"scifi-dine-in-theater-restaurant", "name"=>"Sci-Fi Dine-In Theater Restaurant"}, {"permalink"=>"hollywood-brown-derby", "name"=>"The Hollywood Brown Derby"}, {"permalink"=>"tune-in-lounge", "name"=>"Tune-in Lounge"}]], "attractions"=>[{"permalink"=>"beauty-and-the-beast-live-on-stage", "name"=>"Beauty and the Beast Live on Stage", "short_name"=>"Beauty and the Beast"}, {"permalink"=>"fantasmic", "name"=>"Fantasmic!", "short_name"=>"Fantasmic!"}, {"permalink"=>"honey-i-shrunk-the-kids-movie-set-adventure", "name"=>"Honey, I Shrunk the Kids Movie Set Adventure", "short_name"=>"Honey, I Shrunk The Kids"}, {"permalink"=>"indiana-jones-epic-stunt-spectacular", "name"=>"Indiana Jones Epic Stunt Spectacular", "short_name"=>"Indiana Jones Stunt"}, {"permalink"=>"lights-motors-action-extreme-stunt-show", "name"=>"Lights! Motors! Action! Extreme Stunt Show", "short_name"=>"Lights! Motors! Action!"}, {"permalink"=>"muppet-vision-3d", "name"=>"Muppet*Vision 3-D", "short_name"=>"Muppet*Vision 3-D"}, {"permalink"=>"rock-n-roller-coaster", "name"=>"Rock 'n' Roller Coaster", "short_name"=>"Rock 'n' Roller Coaster"}, {"permalink"=>"star-tours", "name"=>"Star Tours: The Adventures Continue", "short_name"=>"Star Tours 2"}, {"permalink"=>"studio-backlot-tour", "name"=>"Studio Backlot Tour", "short_name"=>"Backlot Tour"}, {"permalink"=>"american-idol-experience", "name"=>"The American Idol Experience", "short_name"=>"American Idol Exper."}, {"permalink"=>"great-movie-ride", "name"=>"The Great Movie Ride", "short_name"=>"Great Movie Ride"}, {"permalink"=>"magic-of-disney-animation", "name"=>"The Magic of Disney Animation", "short_name"=>"Magic of Disney Anim."}, {"permalink"=>"tower-of-terror", "name"=>"The Twilight Zone Tower of Terror", "short_name"=>"Tower of Terror"}, {"permalink"=>"toy-story-mania", "name"=>"Toy Story Mania!", "short_name"=>"Toy Story Mania!"}, {"permalink"=>"voyage-of-the-little-mermaid", "name"=>"Voyage of the Little Mermaid", "short_name"=>"Little Mermaid Voyage"}, {"permalink"=>"walt-disney-one-mans-dream", "name"=>"Walt Disney: One Man's Dream", "short_name"=>"One Man's Dream"}]}} 





=end
