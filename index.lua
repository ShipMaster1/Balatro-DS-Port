scene = "menu"--need to add how to add enhancement to deck table.insert(full_deck,{},i),table.insert(full_deck[i],"blueSeal")
enhancement_kind = 1--menu init
index_menu = 1
deck_able = {"Red", "Blue" , "Yellow", "Green", "Black", "Magic", "Nebula", "Ghost", "Abandoned", "Checkered", "Zodiac", "Painted", "Anaglyph", "Plasma", "Erratic", "Rainbow"}--need achievements for locked
locked_deck = { "Blue","Yellow", "Green", "Black", "Magic", "Nebula", "Ghost", "Abandoned", "Checkered", "Zodiac", "Painted", "Anaglyph", "Plasma", "Erratic"}
deck_details = {
    ["Red"] = "Start with 1 additional discard",
    ["Blue"] = "Start with 1 additional hand",
    ["Yellow"] = "Start with $10",
    ["Green"] = "At end of each Round: $2 per remaining Hand, $1 per remaining Discard, Earn no Interest",
    ["Black"] = "+1 Joker slot, -1 hand",
    ["Magic"] = "Start with +1 consumable slot and 2 copies of The Fool",
    ["Nebula"] = "Start run with telescope voucher, -1 consumable slot",
    ["Ghost"] = "Spectral cards may appear in shop, start with Hex card ",
    ["Abandoned"] = "Start with no face cards",
    ["Checkered"] = "Start with 26 Spades and 26 Hearts",
    ["Zodiac"] = "Start with Tarot Merchant, Planet Merchant and Overstock",
    ["Painted"] = "+2 hand size, -1 Joker slot",
    ["Anaglyph"] = "After defeating Boss Blind gain Double tag",
    ["Plasma"] = "Balance chips and mult when calculating score, X2 base Blind size",
    ["Erratic"] = "All ranks and suits are randomized",
    ["Rainbow"] = "All cards start with 1 enhancement"
} 

stakes = {"White", "Red", "Green", "Black", "Blue", "Purple","Orange", "Gold"}

stakes_info = {
    ["White"] = "Base Difficulty",
    ["Red"] = "Small blind gives no reward",
    ["Green"] = "Required score scales faster with ante",
    ["Black"] = "30% chance for jokers to have Eternal sticker",
    ["Blue"] = "-1 Discard",
    ["Purple"] = "Required score scales even faster with ante",
    ["Orange"] ="30% chance for jokers to have Perishable sticker",
    ["Gold"] = "30% chance for jokers to have Rental sticker",
}

standard_deck = { --used for generating random cards
    "2h", "3h", "4h", "5h", "6h", "7h", "8h", "9h", "th", "jh", "qh", "kh", "ah",
    "2d", "3d", "4d", "5d", "6d", "7d", "8d", "9d", "td", "jd", "qd", "kd", "ad",
    "2s", "3s", "4s", "5s", "6s", "7s", "8s", "9s", "ts", "js", "qs", "ks", "as",
    "2c", "3c", "4c", "5c", "6c", "7c", "8c", "9c", "tc", "jc", "qc", "kc", "ac",
}

card_size = {19,28}--x,y of sprites
hud_width = 80--width of lhs bar
colours = {Color.new(31,31,31),Color.new256(153,0,204), Color.new256(102,0,102),Color.new256(0,50,170) ,Color.new256(153,76,0)}--cards, shop_jokers, jokers, packs,consumable
card_graphic = Image.load("sprites/cards/card.png", VRAM)

blind_multis = {1, 1.5, 2} --used for minimumscore

normal_blind = {{"Small Blind", Color.new256(62, 125, 201)}, {"Big Blind", Color.new256(236, 50, 62)}}

boss_blind = { "The Psychic", "The Hook", "The Manacle", "The Club", "The Goad", "The Window", "The Head"}
boss_blind_locked = {"The Wall", "The Needle","The Arm", "The Water","The Flint", "The Mouth","The Eye", "The Tooth", "The Plant","The Serpent","The Ox"}
boss_blind_description = {
    ["The Psychic"] = {Color.new256(239, 192, 60),"Must Play 5 Cards",1},
    ["The Hook"] = {Color.new256(168, 64, 36),"Discards 2 Cards Every Hand",1},
    ["The Manacle"] = {Color.new256(87, 87, 87),"-1 Hand Size",1},
    ["The Club"] = {Color.new256(185, 203, 146),"All Clubs are Debuffed",1}, 
    ["The Goad"] = {Color.new256(185, 92, 150),"All Spades are Debuffed",1}, 
    ["The Window"] = {Color.new256(169, 162, 149),"All Diamonds are Debuffed",1},
    ["The Head"] = {Color.new256(172, 157, 180),"All Hearts are Debuffed",1},
    ["The Water"] = {Color.new256(153,255,255),"Start with 0 discards",2},
    ["The Arm"] = {Color.new256(102,0,204),"Decrease level of poker hand before scoring",2},
    ["The Mouth"] = {Color.new256(174, 113, 142),"Only 1 Hand Type Can Be Played",2}, 
    ["The Needle"] = {Color.new256(92, 110, 49),"Only 1 Hand",2}, --small blind value
    ["The Wall"] = {Color.new256(138, 89, 165),"Extra Large Blind",2}, --double boss blind value
    ["The Flint"] = {Color.new256(255,128,0),"Base chips and mult from poker hand are halved",2},
    ["The Eye"] = {Color.new256(0,128,255),"No repeat hands this round",3},
    ["The Tooth"] = {Color.new256(181, 45, 45),"Lose $1 per Hand Played.",3}, 
    ["The Plant"] = {Color.new256(112, 146, 132),"All Face Cards are Debuffed",4},
    ["The Serpent"] = {Color.new256(0,102,0),"After Play or Discard draw 3 cards",5},
    ["The Ox"] = {Color.new256(153,76,0),"Playing most played poker hand sets money to $0",6},
    ["Amber Acorn"] = {Color.new256(255,255,255),"Flips and shuffles all jokers",99},--99 = never add to boss_blind
    ["Verdent Leaf"] = {Color.new256(255,255,255),"All cards debuffed until 1 Joker sold",99},
    ["Violet Vessel"] = {Color.new256(255,255,255),"Extra Large Blind",99},--3X boss value
    ["Crimson Heart"] = {Color.new256(255,255,255),"One random Joker disabled every hand",99},--not done
    ["Cerulean Bell"] = {Color.new256(255,255,255),"1 card is always selected",99}
}
finisher_blinds = {"Amber Acorn","Verdent Leaf","Violet Vessel","Cerulean Bell"}
missing_finisher = {"Crimson Heart",}

common_joker = {--missing hanging chad
    "Joker",
    "Greedy Joker",
    "Lusty Joker",
    "Wrathful Joker",
    "Gluttonous Joker",
    "Jolly Joker", 
    "Zany Joker",
    "Mad Joker", 
    "Crazy Joker",
    "Droll Joker",
    "Sly Joker",
    "Willy Joker",
    "Clever Joker",
    "Devious Joker",
    "Crafty Joker",
    "Half Joker",
    "Credit Card",
    "Banner",
    "Mystic Summit",
    "8 Ball",
    "Misprint",
    "Raised Fist",
    "Chaos the Clown",
    "Scary Face",
    "Abstract Joker",
    "Delayed Gratification",
    "Gros Michel",
    "Even Steven",
    "Odd Todd",
    "Scholar",
    "Business Card",
    "Supernova",
    "Ride the Bus",
    "Egg",
    "Runner",
    "Ice Cream",
    "Blue Joker",
    "Faceless Joker",
    "Green Joker",
    "Superposition",
    "To do List",
    "Red Card",
    "Square Joker",
    "Riff-Raff",
    "Photograph",
    "Reserved Parking",
    "Mail in Rebate",
    "Hallucination",
    "Fortune Teller",
    "Juggler",
    "Drunkard",
    "Golden Joker",
    "Popcorn",
    "Walkie Talkie",
    "Smiley Face",
    "Golden Ticket",
    "Swashbuckler",
    "Shoot the Moon"
}
uncommon_joker = {
    "Joker Stencil",
    "Ceremonial Dagger",
    "Marble Joker",
    "Loyalty Card",
    "Fibonacci",
    "Steel Joker",
    "Space Joker",
    "Burglar",
    "Blackboard",
    "Sixth Sense",
    "Constellation",
    "Card Sharp",
    "Madness",
    "Seance",
    "Vampire",
    "Cloud 9",
    "Rocket",
    "Midas Mask",
    "Gift Card",
    "Turtle Bean",
    "Erosion",
    "To the Moon",
    "Stone Joker",
    "Bull",
    "Diet Cola",
    "Trading Card",
    "Spare Trousers",
    "Ramen",
    "Castle",
    "Mr Bones",
    "Acrobat",
    "Troubadour",
    "Certificate",
    "Throwback",
    "Rough Gem",
    "Bloodstone",
    "Arrowhead",
    "Onyx Agate",
    "Flower Pot",
    "Merry Andy",
    "The Idol",
    "Seeing Double",
    "Cartomancer",
    "Bootstraps",
}

rare_joker = {--"Baseball Card",
    "DNA",
    "Vagabond",
    "Baron",
    "Obelisk",
    "Ancient Joker",
    "Campfire",
    "Blueprint",
    "Wee Joker",
    "Hit the Road",
    "The Duo",
    "The Trio",
    "The Family",
    "The Order",
    "The Tribe",
    "Stuntman",
    "Invisible Joker",
    "Brainstorm",
    "Driver's License",
    "Burnt Joker"
}

legendary_joker ={
    "Canio",
    "Triboulet",
    "Yorick",
    "Chicot",
    "Perkeo"
}
joker_info = {
["Joker"] = {2, "+4 Multi",1},
["Greedy Joker"] = {5, "+3 Multi for Diamond Cards",2},
["Gluttonous Joker"] = {5, "+3 Multi for Club Cards",3},
["Wrathful Joker"] = {5, "+3 Multi for Spade Cards",4},
["Lusty Joker"] = {5, "+3 Multi for Heart Cards",5},
["Jolly Joker"] = {3, "+8 Mult if hand contains Pair",6},
["Zany Joker"] = {4, "+12 Mult if hand contains Three Kind",7},
["Mad Joker"] = {4, "+10 Mult if hand contains Two Pair",8},
["Crazy Joker"] = {4, "+12 Mult if hand contains Straight",9},
["Droll Joker"] = {4, "+10 Mult if hand contains Flush",10},
["Sly Joker"] = {3, "+50 Chips if hand contains Pair",11},
["Clever Joker"] = {4, "+80 Chips if hand contains Two Pair",12},
["Half Joker"] = {5, "+20 Mult if hand is 3 or less cards",13},
["Joker Stencil"] = {8, "x1 Mult for all empty joker slots",14},--uncommon
["Banner"] = {5, "+30 Chips for each discard left",15},
["Willy Joker"] = {4, "+100 Chips if played hand contains a Three of a Kind",99},--99 means no image
["Devious Joker"] = {4,"+100 Chips if played hand contains a Straight",99},
["Crafty Joker"] = {4,"+80 Chips if played hand contains a Flush",99},
["Mystic Summit"] = {5,"+15 Mult when 0 discards remaining",99},
["Misprint"] = {4,"+0-23 Mult",99},
["Blue Joker"] = {5,"+2 Chips for each card remaining in Deck",99},
["Abstract Joker"] = {4, "+3 Mult for each Joker", 99},
["Business Card"] = {4, "Played face cards have a 1 in 2 chance to give $2 when scored",99},
["8 Ball"] = {5,"1 in 4 chance for each played 8 to create a Tarot card when scored",99},
["Credit Card"] = {1,"Can go up to $20 in debt",99},
["Raised Fist"] = {5,"Add 2x the lowest ranked card in hand to mult",99},
["Chaos the Clown"] = {4,"1 free reroll per shop",99},
["Delayed Gratification"] = {4,"Earn $2 per discard if no sicards used by end of the round",99},
["Gros Michel"] = {5,"+15 Mult, 1 in 6 chance to be destroyed at the end of round",99},
["Even Steven"] = {4,"Scored even ranked cards give +4 mult",99},
["Odd Todd"] = {4,"Scored odd ranked cards give +31 chips",99},
["Scholar"] = {4,"Played Aces give +20 chips and +4 mult when scored",99},
["Supernova"] = {5, "Adds number of times played poker hand has been played to Mult",99},
["Ride the Bus"] = {6,"This Joker gains +1 Mult per consecutive hand played without a scoring face card",99},
["Egg"] = {4,"Gains $3 of sell value at end of round",99},
["Runner"] = {5, "Gains +15 chips if played hand contans a straight",99},
["Ice Cream"] = {5, "+100 Chips, -5 Chips per hand played",99},
["Faceless Joker"] = {4,"Earn $5 if 3 or more face cards are discarded at the same time", 99},
["Green Joker"] = {4,"+ Mult per hand played, -1 Mult per discard",99},
["Superposition"] = {4,"Create a Tarot card if poker hand contains an Ace and a Straight",99},
["To do List"] = {4,"Earn $4 if poker hand is ",99},
["Cavendish"] = {4,"x3 Mult, 1 in 1000 chance to be destroyed at end of round",99},
["Red Card"] = {5, "Gains +3 Mult when a booster pack is skipped",99},
["Square Joker"] = {4,"Gains +4 Mult if played hand has exactly 4 cards",99},
["Riff-Raff"] = {6,"When Blind selected create 2 random common jokers",99},
["Photograph"] = {5,"First played face card gives X2 Mult when scored",99},
["Reserved Parking"] = {6, "Each face card held in hand has a 1 in 2 chance to give $1",99},
["Mail in Rebate"] = {4, "Earn $5 for each discarded ",99},
["Hallucination"] = {4, "1 in 2 chance to create a tarot card when booster pack is opened",99},
["Fortune Teller"] = {6, "+1 Mult per tarot card used this run",99},
["Juggler"] = {4,"+1 hand size",99},
["Drunkard"] = {4,"+1 discard",99},
["Golden Joker"] = {6, "Earn $4 at end of round",99},
["Popcorn"] = {5,"+20 Mult,-4 Mult per round",99},
["Walkie Talkie"] = {4,"Each played 10 or 4 gives +10 Chips and +4 Mult when scored",99},
["Smiley Face"] = {4, "Played face cards give +5 Mult when scored",99},
["Scary Face"] = {4,"Played face cards give +30 chips when scored",99},
["Golden Ticket"] = {5,"Played Gold cards give $4 when scored",99},
["Swashbuckler"] = {4,"Adds the sell value of all other owned Jokers to Mult",99},
["Shoot the Moon"] = {5,"Each queen held in hand gives +13 Mult",99},
["Ceremonial Dagger"] = {6,"When Blind is selected, destroy Joker to the right and permanently add double its sell value to this Mult",99},
["Marble Joker"] = {6,"When Blind is selected, add a stone card to your deck",99},
["Loyalty Card"] = {5,"X4 Mult every 6 hands played",99},
["Fibonacci"] = {8,"Each played Ace, 2, 3, 5, or 8 gives +8 Mult when scored",99},
["Steel Joker"] = {7,"Gives X0.2 Mult for each Steel Card in your full deck",99},
["Space Joker"] = {5,"1 in 4 chance to upgrade level of played poker hand",99},
["Burglar"] = {6,"When Blind selected, gain +3 hands and lose all discards",99},
["Blackboard"] = {6,"X3 Mult if all cards held in hand are spades or clubs",99},
["Sixth Sense"] = {6,"If first hand of round is a single 6, destroy it and create a Spectral card",99},
["Constellation"] = {6,"Gain X0.1 Mult everytime a planet card is used, Min X1 is retroactive",99},--had it nonretro at first but bit confusing with how stuff was displayed
["Card Sharp"] = {6,"X3 Mult is played poker hand has already been played this round",99},
["Madness"] = {7,"When Small Blind or Big Blind is selected, gain X0.5 Mult and destroy a random Joker",99},
["Seance"] = {6, "If poker hand is a straight flush create a random Spectral card",99},
["Vampire"] = {7,"This Joker gains X0.1 Mult per scoring Enhanced card played, removes card Enhancement",99},
["Cloud 9"] = {7,"Earn $1 for each 9 in your full deck at end of round",99},
["Rocket"] = {6, "Earn $1 at end of round. Payout increases by $2 when Boss Blind is defeated",99},
["Midas Mask"] = {7, "All played face cards become gold cards when scored",99},
["Gift Card"] = {6, "Jokers gain $1 of sell value at round end",99},
["Turtle Bean"] = {6,"+5 hand size reduces by 1 each round",99},
["Erosion"] = {6, "+4 Mult for each card below the starting number of cards",99},
["To the Moon"] = {5,"Earn an extra $1 of interest for every $5 you have at end of round",99},
["Stone Joker"] = {6,"Gives +25 Chips for each Stone Card in your full deck",99},
["Bull"] = {6,"+2 chips for each $1",99},
["Diet Cola"] = {6,"Gain a Double tag when this is sold",99},
["Trading Card"] = {6,"If first discard of round has only 1 card, destroy it and earn $3",99},
["Spare Trousers"] = {6,"Gain +2 Mult if played hand contains a Two Pair",99},
["Ramen"] = {6,"X2 Mult, loses X0.01 per card discarded",99},
["Castle"] = {6,"Gain +3 chips for each discarded ",99},
["Mr Bones"] = {5,"Prevent Death if score at least 25% of minimum score",99},
["Acrobat"] = {6,"X2 Mult on final hand of round",99},
["Troubadour"] = {6,"+2 hand size, -1 hand",99},
["Certificate"] = {6,"When round begins, add a random playing card with a random seal to your hand",99},
["Throwback"] = {6,"Additional X0.25 Mult for every blind skipped starts at X1 is retroactive",99},
["Rough Gem"] = {7, "Scoring Diamond give $1",99},
["Bloodstone"] = {7,"1 in 2 chance for scoring Hearts to give X1.5 Mult",99},
["Arrowhead"] = {7,"Scoring Spades give +50 chips",99},
["Onyx Agate"] = {7,"Scoring Clubs give +7 Mult",99},
["Flower Pot"] = {6,"X3 Mult if poker hand contains a  Diamond card,  Club card,  Heart card, and  Spade card",99},
["Merry Andy"] = {7, "+3 discards, -1 hand size",99},
["The Idol"] = {6,"X2 Mult when scoring card is ",99},
["Seeing Double"] = {6,"X2 Mult if played hand has a scoring  Club card and a scoring card of any other suit",99},
["Cartomancer"] = {6,"Create a Tarot card whenBlind is selected",99},
["Bootstraps"] = {7,"+2 Mult for every $5",99},
["DNA"] = {8,"If first hand of round has only 1 card, add a permanent copy to deck and draw it to hand",99},
["Vagabond"] = {8,"Create a Tarot card if hand is played with $4 or less",99},
["Baron"] = {8,"Each King held in hand gives X1.5 Mult",99},
["Obelisk"] = {8,"This Joker gains X0.2 Mult per consecutive hand played without playing your most played poker hand",99},
["Ancient Joker"] = {8,"X1.5 Mult for scoring cards with ",99},
["Campfire"] = {9,"This Joker gains X0.25 Mult for each card sold, resets when Boss Blind is defeated",99},
["Blueprint"] = {10,"Copies ablity of joker to the right",99},
["Wee Joker"] = {8,"This Joker gains +8 Chips when each played 2 is scored",99},
["Hit the Road"] = {8,"This Joker gains X0.5 Mult for every Jack discarded",99},
["The Duo"] = {8, "X2 Mult if played hand contains a pair",99},
["The Trio"] = {8,"X3 Mult if played hand contains a Three of a Kind",99},
["The Family"] = {8,"X4 Mult if played hand contains a Four of a Kind",99},
["The Order"] = {8,"X3 Mult if played hand contains a Straight",99},
["The Tribe"] = {8,"X2 Mult if played hand contains a Flush",99},
["Stuntman"] = {7,"+250 Chips, -2 hand Size",99},
["Invisible Joker"] = {8,"After 2 rounds, sell this card to Duplicate a random Joker",99},
["Brainstorm"] = {10,"Copies ability of leftmost joker",99},
["Driver's License"] = {7,"X3 Mult if aleast 16 enhanced cards in full deck",99},
["Burnt Joker"] = {8,"Upgrade the level of the first discarded poker hand of the round",99},
["Canio"] = {20,"Gains X1 Mult when a Face card is destroyed",99},
["Triboulet"] = {20,"Played Kings and Queens give X2 mult when scored",99},
["Yorick"] = {20,"Gains X1 Mult every 23 cards discarded",99},
["Perkeo"] = {20,"At the end of shop, add a negative copy of a random consumable",99},
["Chicot"] = {20,"Disable Boss Blind ability",99}
}

shop_costs = {1,3,3,4,{4,6,8},10}--playing cards,tarots,planets,spectral,packs,vouchers

planets_deck = {"","Pluto", "Mercury", "Uranus", "Venus", "Saturn", "Jupiter", "Earth", "Mars", "Neptune"}
full_planets = {"","Pluto", "Mercury", "Uranus", "Venus", "Saturn", "Jupiter", "Earth", "Mars", "Neptune"}--used for reset
locked_planets = {--unlocked when played not tested
    ["5 of a Kind"]="Planet X",
    ["Flush House"]="Ceres",
    ["Flush Five"]="Eris"
}

planets_info = {
    [""] = {0,0,""},
    ["Pluto"] = {10,1,"High Card"}, 
    ["Mercury"] = {15,1,"Pair"}, 
    ["Uranus"] = {20,1,"Two Pair"}, 
    ["Venus"] = {20,2,"3 of a Kind"}, 
    ["Saturn"] = {30,3,"Straight"}, 
    ["Jupiter"] = {15,2,"Flush"}, 
    ["Earth"] = {25,2,"Full House"}, 
    ["Mars"] = {30,3,"4 of a Kind"}, 
    ["Neptune"] = {40,4,"Straight Flush"}, 
    ["Planet X"] = {35,3,"5 of a Kind"}, 
    ["Ceres"] = {40,4,"Flush House"}, 
    ["Eris"] = {50,3,"Flush Five"}
}

min_hand_multipliers = {
    [""] = {0,0},
    ["High Card"] = {5, 1},
    ["Pair"] = {10, 2},
    ["Two Pair"] = {20, 2},
    ["3 of a Kind"] = {30, 3},
    ["Straight"] = {30, 4},
    ["Flush"] = {35, 4,},
    ["Full House"] = {40, 4},
    ["4 of a Kind"] = {60, 7},
    ["Straight Flush"] = {100, 8},
    ["5 of a Kind"] = {120, 12},
    ["Flush House"] = {140, 14},
    ["Flush Five"] = {160, 16}
}
type_base_prob = {20/3,20/3,20/3,2,1}--standard,tarot, planet, bufoon,spectral
size_base_prob = {4,2,1}--small,mid,large pack
type_tot_prob = 0
for i,v in ipairs(type_base_prob) do 
    type_tot_prob = type_tot_prob + v
end
size_tot_prob = 0
for i,v in ipairs(size_base_prob) do
    size_tot_prob = size_tot_prob + v
end
for i,v in ipairs(type_base_prob) do
    type_base_prob[i] = v/type_tot_prob
end
for i,v in ipairs(size_base_prob) do
    size_base_prob[i] = v/size_tot_prob
end
pack_type = {"standard", "arcana", "celestial", "bufoon", "spectral"}
pack_size = {
    [1] = "normal, Choose 1 card to be used immediately",
    [2] = "jumbo, Choose 1 card to be used immediately",
    [3] = "mega, Choose 2 cards to be used immediately"}

tarots_deck = {"The Fool","The Magician", "The High Priestess", "The Empress", "The Emperor", "The Heirophant", "The Chariot","Justice", "The Hermit", "The Wheel of Fortune", "Strength", "The Hanged Man", "Death", "Temperence", "The Tower", "The Devil", "The Star", "The Moon", "The Sun", "Judgement", "The World"}
tarots_info = {--missing wild cards
    ["The Fool"] = "Creates the last Tarot or Planet card used during this run",
    ["The Magician"] = "convert up to 2 cards to Lucky cards",
    ["The High Priestess"] = "Creates up to 2 planet cards",
    ["The Empress"] = "Convert up to 2 cards to Mult cards",
    ["The Emperor"] = "Creates up to 2 tarot cards",
    ["The Heirophant"] = "Converts up to 2 cards to Bonus cards",
    ["The Chariot"] = "Convert 1 card into a Steel card",
    ["Justice"] = "Convert 1 card into a Glass card",
    ["The Hermit"] = "Double money (max $20)",
    ["The Wheel of Fortune"] = "1 in 4 cahnce to give a random joker Foil, Holographic or Polychrome",
    ["Strength"] = "Increase the rank on up to 2 cards by 1",
    ["The Hanged Man"] = "Destroy up to 2 Cards",
    ["Death"] = "Convert the left card into the right card",
    ["Temperence"] = "Gives total sell value of all jokers (max $50)",
    ["The Tower"] = "Convert 1 card to a Stone card (+50 chips, always scores)",
    ["The Devil"] = "Convert 1 card into a Gold card",
    ["The Star"] = "Convert up to 3 cards to Diamonds",
    ["The Moon"] = "Convert up to 3 cards to Clubs",
    ["The Sun"] = "Convert up to 3 cards to Hearts",
    ["Judgement"] = "creates a random joker (must have room)",
    ["The World"] = "Convert up to 3 cards to Spades"
}

spectral_deck = {"Familiar","Grim", "Incantation", "Aura", "Sigil", "Ouija", "Ectoplasm","Immolate", "Ankh", "Hex", "Trance", "Medium", "Cryptid"}--dejavu
spectral_info = {
    ["Familiar"] = "Destroy 1 random card in hand but add 3 random enchanted face cards",
    ["Grim"] = "Destroy 1 random card in hand but add 2 random enchanted ace cards",
    ["Incantation"] = "Destroy 1 random card in hand but add 4 random numbered cards",
    ["Aura"] = "Add Foil, Holographic or Polychrome to a selected card in hand",
    ["Wraith"] = "Create a random rare joker, set money to $0",
    ["Sigil"] = "Convert all cards in hand to a single random suit",
    ["Ouija"] = "Convert all cards in hand to a single random rank but -1 hand size",
    ["Ectoplasm"] = "Add Negative to a random joker, but -1 hand size, plus another -1 hand size for each time Ectoplasm has been used this run",
    ["Immolate"] = "Destroy 5 random cards in hand, gain $20",
    ["Ankh"] = "Creates an exact copy of 1 of your Jokers at random, then destroys the others",
    ["Deja Vu"] = "Add a Red Seal to a selected card",
    ["Hex"] = "Add Polychrome to a random joker but destroys the rest",
    ["Trance"] = "Add a blue seal to a selected card",
    ["Medium"] = "Add a Purple Seal to a selected card",
    ["Cryptid"] = "Create 2 exact copies of a selected card",
    ["The Soul"] = "Create a legendary Joker",--0.3% chance
    ["Black Hole"] = "Increase all poker hands by 1 level"--0.3% chance
}

consumable_deck = {tarots_info,planets_info,spectral_info}

vouchers_info = {
    ["Overstock"] = "Up to 3 Card slots in shop",
    ["Clearence Sale"] = "All cards and packs in shop are 25% off",
    ["Reroll Surplus"] = "Rerolls cost $2 less",
    ["Crystal Ball"] = "+1 consumable slot",
    ["Grabber"] = "+1 hand permanently",
    ["Wasteful"] = "+1 discard permanently",
    ["Seed Money"] = "interest capped at $10",
    ["Heiroglyph"] = "-1 ante, -1 hand",
    ["Director's Cut"] = "Reroll boss blind once for $10",
    ["Paint Brush"] = "+1 hand size",
    ["Tarot Merchant"] = "Tarot appear 2x as often",
    ["Planet Merchant"] = "Planets appear 2x as often",
    ["Telescope"] = "Most common poker hand always shows up in celestial packs",
    ["Magic Trick"] = "Playing Cards can be purchased from the shop",
    ["Hone"] = "Foil,Holographic and Polychrome cards appear 2X as often",
    ["Blank"] = "Does nothing?",
    ["Antimatter"] = "+1 Joker Slot",
    ["Overstock Plus"] = "Up to 4 Card slots in shop",
    ["Liquidation"] = "All cards and packs in shop are an additional 25% off",
    ["Reroll Glut"] = "Rerolls cost an additional $2 less",
    ["Observatory"] = "Planet cards in your consumable slot give X1.5 Mult to their poker hand",
    ["Nacho Tong"] = "+1 hand permanently",
    ["Recyclomancy"] = "+1 discard permanently",
    ["Tarot Tycoon"] = "Tarot cards appear and additional 2X",
    ["Planet Tycoon"] = "Planet cards appear and additional 2X",
    ["Money Tree"] = "interest capped at $20",
    ["Petroglyph"] = "-1 ante, -1 hand",
    ["Palette"] = "+1 hand size",
    ["Retcon"] = "Reroll boss blind an unlimited number of times",
    ["Glow Up"] = "Foil,Holographic and Polychrome cards appear an additional 2X as often",
    ["Illusion"] = "Standard cards in the shop can have enchancements"
}

tag_deck = {"Economy", "Speed", "D6", "Juggle", "Double","Charm","Boss", "Voucher", "Investment","Rare","Uncommon","Foil","Holographic","Polychrome","Coupon"}
tag_unlock_2 = {"Standard", "Meteor", "Bufoon","Handy","Garbage", "Ethereal","Top-Up", "Orbital","Negative"}
tag_info = {
    ["Foil"] = "Next Base edition joker is Foil and free",
    ["Holographic"] = "Next Base edition joker is Holographic and free",
    ["Polychrome"] = "Next Base edition joker is Polychrome and free",
    ["Negative"] = "Next Base edition joker is Negative and free",
    ["Economy"] = "Doubles your money (Max $40)",
    ["Speed"] = "Gain $5 for number of blinds skipped",
    ["D6"] = "In next shop rerolls start at $0",
    ["Juggle"] = "+3 hands next round only",
    ["Double"] = "Gains copy of next tag selected",
    ["Charm"] = "Open a Mega arcana pack immediately",
    ["Boss"] = "Reroll boss blind",
    ["Voucher"] = "Add Voucher to shop",
    ["Coupon"] = "Add total cost of shop excluidng voucher to cash",--not exactly but in the spirit
    ["Investment"] = "Gain $25 after defeating boss blind",
    ["Uncommon"] = "Adds a free uncommon joker to shop",
    ["Rare"] = "Adds a free rare joker to the shop",
    ["Standard"] = "Open a Mega standard pack immediately",
    ["Meteor"] = "Open a Mega Celestial pack",
    ["Bufoon"] = "Open a Mega Bufoon pack",
    ["Handy"] = "Gain $1 for each hand played this run",
    ["Garbage"] = "Gain $1 for each discard used this run",
    ["Ethereal"] = "Open a Mega Spectral pack",
    ["Top-Up"] = "Create up to 2 random common Jokers",
    ["Orbital"] = "Upgrade a most played Poker Hand by 3 levels"--i know this isnt what it is but is very awkward to get to work and display
}

card_enhancement = {"Gold","Steel","Glass","Lucky","Mult"}--"Stone"not in due grim etc.
editions = {"Polychrome", "Holographic","Foil"}--same for negative
seals = {"Gold-Seal", "Blue-Seal", "Purple-Seal"}

enhancement_info = {
    ["Gold"] = {"Gain $3 if held at round end","Enhancment"},
    ["Steel"] = {"x1.5 mult if held when hand played","Enhancement"},
    ["Glass"] = {"x2 mult and 25% chance to break when played","Enhancement"},
    ["Mult"] = {"+4 mult","Enhancement"},
    ["Lucky"] = {"x1.5 mult: 1 in 5 chance, $20: 1 in 15 chance when played","Enhancement"},
    ["Stone"] = {"+50 Chips, always scores no rank or suit","Enhancement"},
    ["Foil"] = {"+50 chips","Edition"},
    ["Polychrome"] = {"x1.5 mult","Edition"},
    ["Holographic"] = {"+10 mult","Edition"},
    ["Negative"] = {"+1 Slot","Edition"},
    ["Gold-Seal"] = {"$3 when scoring", "Seal"},
    ["Blue-Seal"] = {"Planet card of winning hand added to consumable slot if held in hand","Seal"},
    ["Purple-Seal"] = {"When discarded create a tarot card","Seal"},--not setup with The Hook
    ["Eternal"] = {"Joker cannot be sold or destroyed","Sticker"},
    ["Perishable"] = {"Joker self destructs in 5 rounds","Sticker"},--not exctly but not worked out debuffed jokers
    ["Rental"] = {"Cost $1, lose $2 at end of round","Sticker"}
}

rank_graphics = {["t"] = Image.load("sprites/cards/1.png", VRAM), ["2"] = Image.load("sprites/cards/2.png", VRAM), ["3"] = Image.load("sprites/cards/3.png", VRAM), ["4"] = Image.load("sprites/cards/4.png", VRAM), ["5"] = Image.load("sprites/cards/5.png", VRAM), ["6"] = Image.load("sprites/cards/6.png", VRAM), ["7"] = Image.load("sprites/cards/7.png", VRAM), ["8"] = Image.load("sprites/cards/8.png", VRAM), ["9"] = Image.load("sprites/cards/9.png", VRAM), ["j"] = Image.load("sprites/cards/j.png", VRAM), ["k"] = Image.load("sprites/cards/k.png", VRAM), ["q"] = Image.load("sprites/cards/q.png", VRAM), ["a"] = Image.load("sprites/cards/a.png", VRAM),}
suit_graphics = {["d"] = Image.load("sprites/cards/d.png", VRAM), ["c"] = Image.load("sprites/cards/c.png", VRAM), ["s"] = Image.load("sprites/cards/s.png", VRAM), ["h"] = Image.load("sprites/cards/h.png", VRAM),}
joker_graphics = Image.load("sprites/cards/jokers.png", VRAM)

hudbg = Image.load("sprites/ui/hudbackground.png", VRAM) 
hud = Image.load("sprites/ui/hud.png", VRAM)
blind_ui = Image.load("sprites/ui/blindui.png", VRAM)
blind_ui_box = Image.load("sprites/ui/blinduibox.png", VRAM)
tutorial_sheet = Image.load("sprites/ui/ui.png", VRAM)
shop_sheet = Image.load("sprites/ui/moreui.png", VRAM)
menubg = Image.load("sprites/ui/mainmenubg.png", VRAM)
Image.scale(menubg, SCREEN_WIDTH, SCREEN_HEIGHT)
logo = Image.load("sprites/ui/logo.png", VRAM)
img_packs = Image.load("sprites/cards/packs.png", VRAM)

Sound.loadBank("soundbanks/soundbank.bin") 
Sound.loadMod(0)
Sound.loadSFX(0)
Sound.loadSFX(1)
Sound.setModVolume(600)
Sound.setSFXVolume(0,255)
Sound.setSFXVolume(1,255)
Sound.startMod(0, PLAY_LOOP) -- sounds bad
MOD_volume = 1
SFX_volume = 1
music_vol = true

function hard_reset()--done when resetting run
    round = 0
    blind = 1--up to 3, 3 is boss
    ante = 1--up to 8 then endless
    minimumscore = {}--small,big,boss
    tag_select = {}
    blind_tags = {}
    cash = 0
    hand_cash = 1
    discard_cash = 0
    gameplay_phase = 0
    consumable_size = 2
    shop_card_size = 2
    max_interest = 5
    min_cash = 0 --used for credit card
    discount_percent = 1
    packs = {}
    consumable = {}
    consumable_enhancement = {}--only used for perkeo
    general_tarot = false
    total_consumable = 0
    total_planets = 0
    jokers = {}
    jokers_enhancement = {}--effectdetails, cost, enhancements
    last_played_hand = ""
    logo_bop = -120
    kind = 1
    boss_reroll = false
    boss_reroll_num = 0
    joker_size = 5
    max_hands = 4
    max_discards = 3
    max_hand_size = 8
    min_reroll = 5
    selected_card = 1
    selected_deck = 1
    selected_stake = 1
    seeded_run, seeded_num = false, 0 
    ecto_used = 0 
    no_blinds_skipped = 0
    no_hands_played = 0
    no_discards_used = 0
    boss_active = true
    hand_multipliers = {
        [""] = {0, 0, 0, ""},--chips, mult, times played, planet
        ["High Card"] = {5, 1, 0, "Pluto"},
        ["Pair"] = {10, 2, 0, "Mercury"},
        ["Two Pair"] = {20, 2, 0, "Uranus"},
        ["3 of a Kind"] = {30, 3, 0, "Venus"},
        ["Straight"] = {30, 4, 0, "Saturn"},
        ["Flush"] = {35, 4, 0, "Jupiter"},
        ["Full House"] = {40, 4, 0, "Earth"},
        ["4 of a Kind"] = {60, 7, 0, "Mars"},
        ["Straight Flush"] = {100, 8, 0, "Neptune"},
        ["5 of a Kind"] = {120, 12, 0, "Planet X"},
        ["Flush House"] = {140, 14, 0,"Ceres"},
        ["Flush Five"] = {160, 16, 0,"Eris"}
    }
    shop_weights = {20,4,4}--joker,tarots,planets
    shop_locked_weights = {4,2}--playing cards, spectral
    shop_jokers_enhancement_weight = {0.003,0.006,0.02,0.04}--Cumilative negative,poly, holo, foil
    shop_cards_enhancement_weight = {0.4,0.08,0.2}--enhancement,edition,seal
    cards_edition_prob = {0.15,0.5,1}--Cumilative poly,holo, foil for cards
    reset_shop_weights()
    ante_bases = {300, 800, 2000, 5000, 11000, 20000, 35000, 50000, 110000, 560000, 72e5, 3e8, 47e9, 2.9e13, 7.7e16, 8.6e20, 4,2e25, 9.2e30, 9.2e36, 4.3e43, 9.7e50, 1e59, 5.8e67, 1.6e77, 2.4e87,1.9e98, 8.4e109, 2e122, 2.7e135, 2.1e149, 9.9e163, 2.7e179, 4.4e195, 4.4e212, 2.8e230, 1.1e249, 2.7e268,4.5e288, 4.8e309}
    blind_payouts = {3, 4, 5}--money need to add finisher 
    telescope, observatory, shop_enhanced = false, false, false
    vouchers = {"Overstock", "Clearence Sale", "Reroll Surplus", "Crystal Ball", "Grabber", "Wasteful", "Seed Money", "Heiroglyph", "Director's Cut", "Paint Brush", "Tarot Merchant", "Planet Merchant", "Telescope", "Magic Trick","Blank","Hone"}--all cost $10
    full_deck_enhancement = {}
    stickers = {}--insert when deck selected
end

function soft_reset()--done when increasing blind/ante
    round_score = 0
    hand = {}
    hand_enhancement = {}
    dealt = {}
    dealt_enhancement = {}
    played_hand_type = {}
    shop_jokers = {}
    shop_jokers_enhancement = {}
    used_cards = {}
    packs = {}
    pack_enhancement = {}
    selected_card = 1
    first = 0
    chips = 0
    multiplier = 0
    reroll_price = min_reroll
    hand_type = ""
    hands = max_hands
    discards = max_discards
    hand_size = max_hand_size
    win = false
    sort_mode = false--false = rank , true = suit
    can_play_hand = false
    can_discard = false
    joker_sale = false--only used for 1 boss
    reset_deck()
end

function reset_shop_weights()
    local shop_tot_prob = 0
    for i,v in ipairs(shop_weights) do 
        shop_tot_prob = shop_tot_prob + v
    end
    for i,v in ipairs(shop_weights) do
        shop_weights[i] = v/shop_tot_prob
    end
end

function reset_deck()
    deck = {}
    deck_enhancement = {}
    for i, v in ipairs(full_deck) do
        table.insert(deck,v)
    end
    for i,v in ipairs(full_deck_enhancement) do
        table.insert(deck_enhancement,v)
    end
end

function get_deck_adjust(deck_name)
    if deck_name == "Red" then
        max_discards = max_discards + 1
    elseif deck_name == "Blue" then
        max_hands = max_hands + 1
    elseif deck_name == "Yellow" then
        cash = 10
    elseif deck_name == "Green" then
        hand_cash = 2
        discard_cash = 1
        max_interest = 0
        table.remove(vouchers,7)
    elseif deck_name == "Black" then
        max_hands = max_hands-1
        joker_size = joker_size+1
    elseif deck_name == "Magic" then
        table.insert(consumable,"The Fool")
        table.insert(consumable,"The Fool")
        table.insert(consumable_enhancement," ")
        table.insert(consumable_enhancement," ")
        use_vouchers("Crystal Ball")
    elseif deck_name == "Nebula" then
        consumable_size = consumable_size-1
        use_vouchers("Telescope")
    elseif deck_name == "Ghost" then
        table.insert(shop_weights,shop_locked_weights[2])
        table.insert(consumable,"Hex")
        table.insert(consumable_enhancement," ")
    elseif deck_name == "Zodiac" then
        use_vouchers("Overstock")
        use_vouchers("Tarot Merchant")
        use_vouchers("Planet Merchant")
    elseif deck_name == "Painted" then
        max_hand_size = max_hand_size + 2
        joker_size = joker_size -1
    end
    if selected_stake >= 4 then
        table.insert(stickers,"Eternal")
        if selected_stake >= 7 then
            table.insert(stickers,"Perishable")
            if selected_stake == 8 then
                table.insert(stickers,"Rental")
            end
        end
    end
end

function get_deck(deck_name)
    if deck_name == "Abandoned" then
        full_deck = {
            "2h", "3h", "4h", "5h", "6h", "7h", "8h", "9h", "th", "ah",
            "2d", "3d", "4d", "5d", "6d", "7d", "8d", "9d", "td", "ad",
            "2s", "3s", "4s", "5s", "6s", "7s", "8s", "9s", "ts", "as",
            "2c", "3c", "4c", "5c", "6c", "7c", "8c", "9c", "tc", "ac",
        }
    elseif deck_name == "Checkered" then
        full_deck = {
            "2h", "3h", "4h", "5h", "6h", "7h", "8h", "9h", "th", "jh", "qh", "kh", "ah",
            "2h", "3h", "4h", "5h", "6h", "7h", "8h", "9h", "th", "jh", "qh", "kh", "ah",
            "2s", "3s", "4s", "5s", "6s", "7s", "8s", "9s", "ts", "js", "qs", "ks", "as",
            "2s", "3s", "4s", "5s", "6s", "7s", "8s", "9s", "ts", "js", "qs", "ks", "as",
        }
    elseif deck_name == "Erratic" then
        full_deck = {}
        for i = 1, 52 do
            local index = math.random(#standard_deck)
            table.insert(full_deck,standard_deck[index])
        end
    else
        full_deck = {
            "2h", "3h", "4h", "5h", "6h", "7h", "8h", "9h", "th", "jh", "qh", "kh", "ah",
            "2d", "3d", "4d", "5d", "6d", "7d", "8d", "9d", "td", "jd", "qd", "kd", "ad",
            "2s", "3s", "4s", "5s", "6s", "7s", "8s", "9s", "ts", "js", "qs", "ks", "as",
            "2c", "3c", "4c", "5c", "6c", "7c", "8c", "9c", "tc", "jc", "qc", "kc", "ac",
        }
    end
    full_deck_enhancement = {}
    for i,v in ipairs(full_deck) do
        local rank  = string.sub(v,1,1)
        table.insert(full_deck_enhancement,{convert_rank_to_num(rank)})
    end
    if deck_name == "Rainbow" then
        for i=1,#full_deck do
            local addition = get_random_enhance()
            table.insert(full_deck_enhancement[i],addition)
        end
    end
    deck_size = #full_deck
end

function get_random_enhance()
    local index = math.random(#card_enhancement+#editions+#seals)
    local addition
    if index < #card_enhancement+1 then
        addition = card_enhancement[index]
    elseif index > #card_enhancement+#editions then
        index = index-(#card_enhancement+#editions)
        addition = seals[index]
    else
        index = index-(#card_enhancement)
        addition = editions[index]
    end
    return addition
end

function stake_begin(stake_name)
    if stake_name == "Red" then
        blind_payouts[1] = 0
    elseif stake_name == "Green" then
        local ante_fast = {300,900,2600,8000,20000,36000,60000}
        for i,v in ipairs(ante_bases)do
            if i<8 then
                ante_bases[i] = ante_fast[i]
            else
                ante_bases[i] = 2*v
            end
        end
    elseif stake_name == "Blue" then
        max_discards = max_discards-1
    elseif stake_name == "Purple" then
        local ante_fast = {300,1000,3200,9000,25000,60000,110000}
        for i,v in ipairs(ante_bases)do
            if i<8 then
                ante_bases[i] = ante_fast[i]
            else
                ante_bases[i] = 4*v
            end
        end
    end 
end

function reset_planets()
    planets_deck = {}
    for i, v in ipairs(full_planets) do
        table.insert(planets_deck,v)
    end
end

function position(rank)
    if rank == "k" then
        return 13
    elseif rank == "q" then
        return 12
    elseif rank == "j" then
        return 11
    elseif rank == "t" then
        return 10
    elseif rank == "a" then
        return 14
    elseif rank == "s" then
        return 15
    else
        return tonumber(rank)
    end
end

function sort_deck(deck,deck_enhancement)
    if sort_mode == false then
        return sort_deck_rank(deck,deck_enhancement)
    else
        return sort_deck_suit(deck,deck_enhancement)
    end
end

function sort_deck_rank(deck,deck_enhancement)
    local rearrange1 = {}
    for i,v in ipairs(deck) do
        rearrange1[i] = position(string.sub(v,1,1))
    end
    for j = 2, #deck do
        local key = rearrange1[j]
        local key2 = deck[j]
        local key3 = deck_enhancement[j]
        local i = j - 1
        while i > 0 and rearrange1[i] > key do
            rearrange1[i + 1] = rearrange1[i]
            deck[i + 1] = deck[i]
            deck_enhancement[i+1] = deck_enhancement[i]
            i = i - 1
        end
        rearrange1[i + 1] = key
        deck[i + 1] = key2
        deck_enhancement[i+1] = key3
    end
    return deck, deck_enhancement
end

function sort_deck_suit(deck,deck_enhancement)
    local rearrange1 = {}
    for i,v in ipairs(deck) do
        if string.sub(v,2,2) == "h" then
            rearrange1[i] = 1
        elseif string.sub(v,2,2) == "d" then
            rearrange1[i] = 2
        elseif string.sub(v,2,2) == "s" then
            rearrange1[i] = 3
        elseif string.sub(v,2,2) == "c" then
            rearrange1[i] = 4
        else
            rearrange1[i] = 5
        end
    end
    for j = 2, #deck do
        local key = rearrange1[j]
        local key2 = deck[j]
        local key3 = deck_enhancement[j]
        local i = j - 1
        while i > 0 and rearrange1[i] > key do
            rearrange1[i + 1] = rearrange1[i]
            deck[i + 1] = deck[i]
            deck_enhancement[i+1] = deck_enhancement[i]
            i = i - 1
        end
        rearrange1[i + 1] = key
        deck[i + 1] = key2
        deck_enhancement[i+1] = key3
    end
    return deck, deck_enhancement
end

function bounds(deck,selected)
    if #deck ~= 0 then--voucher behaving poorly
        if selected > #deck then
            selected = 1
        elseif selected < 1 then
            selected = #deck
        end
    end
    return selected
end

function dic_size(rank_dupe,ranked)
    local unique = {rank_dupe[ranked[1]]}
    local done = {ranked[1]}
    for i=2, #ranked do
        if done[#done] ~= ranked[i] then
            table.insert(done,ranked[i])
            table.insert(unique,rank_dupe[ranked[i]])
        end
    end
    return unique
end

function hand_ignore(handplay, unique,rank_dupe,card_count,do_ignore)--i dont remember how this works,this is bad news
    local count = 0
    local i = 1
    local count_ignore = {}
    while count<#handplay-card_count do
        if handplay[i] ~= "st" then
            if rank_dupe[position(string.sub(handplay[i],1,1))] < unique[#unique] then
                count = count + 1
                table.insert(count_ignore,count,handplay[i])
            end
        else
            count = count +1
        end
        i = i+1
    end
    return count_ignore
end

function get_hand_type(hand_play)
    straight = false
    flush = false
    contains_5 = false
    contains_4 = false
    contains_2pair = false
    contains_3 = false
    conatins_pair = false
    local rank_dupe = {}
    local ranked = {}
    local suited = {}
    local card_count
    ignore = {}
    for i,v in ipairs(hand_play) do
        suited[i] = string.sub(v,2,2)
        ranked[i] = position(string.sub(v,1,1))
        if v ~= "st" then--chance this screws up the indexing
            if rank_dupe[ranked[i]] == nil then
                rank_dupe[ranked[i]] = 1
            else
                rank_dupe[ranked[i]] = rank_dupe[ranked[i]] + 1
            end
        end
    end

    table.sort(ranked)
    table.sort(suited)
    local range = ranked[#ranked] - ranked[1]
    local unique = dic_size(rank_dupe,ranked) --values from dictionary
    table.sort(unique) --sort low to high

    if unique[#unique] == 5 then
        contains_5 = true
        contains_4 = true
        contains_3 = true
        conatins_pair = true
    elseif unique[#unique] == 4 then
        contains_4 = true
        contains_3 = true
        conatins_pair = true
    elseif unique[#unique] == 3 then
        contains_3 = true
        conatins_pair = true
        if unique[#unique-1] == 2 then
            contains_2pair = true
        end
    elseif unique[#unique] == 2 then
        conatins_pair = true
        if unique[#unique-1] == 2 then
            contains_2pair = true
        end
    end

    if rank_dupe[14] == 1 and rank_dupe[2] == 1 and rank_dupe[3] == 1 and rank_dupe[4] == 1 and rank_dupe[5] == 1 then
        straight = true
    elseif #unique == 5 and range == 4 then --range condition will have to change to successive check when adding in ways to alter deck
        straight = true
        card_count = 5
    end

    if suited[1] == suited[#suited] and #hand_play == 5 then
        flush = true
        card_count = 5
    end

    
    if straight == true and flush == true then
        return "Straight Flush"
    elseif straight == true and flush == false then
        return "Straight"
    elseif straight == false and flush == true then
        return "Flush"
    end

    if #unique == 2 and unique[2] == 3 and unique[1] == 2 then
        card_count = 5
        if flush == true then
            return "Flush House"
        else
            return "Full House"
        end
    end

    if #unique == 1 and unique[1] == 5 then -- does nothing atm as deck is not changeble
        card_count = 5
        if flush == true then
            return "Flush Five"
        else 
            return "5 of a Kind"
        end
    end
    if #unique == 1 and unique[1] == 4 then
        card_count = 4
        return "4 of a Kind"
    elseif #unique == 2 and unique[2] == 4 then
        card_count = 4
        ignore = hand_ignore(hand_play,unique,rank_dupe,card_count)
        return "4 of a Kind"
    end

    if #unique == 1 and unique[1] == 3 then
        card_count = 3
        return "3 of a Kind"
    elseif #unique == 2 and unique[2] == 3 then
        card_count = 3
        ignore = hand_ignore(hand_play,unique,rank_dupe,card_count)
        return "3 of a Kind"
    elseif #unique == 3 and unique[3] == 3 then
        card_count = 3
        ignore = hand_ignore(hand_play,unique,rank_dupe,card_count)
        return "3 of a Kind"
    end

    if  #unique == 2 and unique[1] == unique[2] and unique[2] == 2 then
        card_count = 4
        return "Two Pair"
    elseif #unique == 3 and unique[2] == unique[3] and unique[3] == 2 then
        card_count = 4
        ignore = hand_ignore(hand_play,unique,rank_dupe,card_count)
        return "Two Pair"
    end

    if #unique == 1 and unique[1] == 2 then
        card_count = 2
        return "Pair"
    elseif #unique == 2 and unique[2] == 2 then
        card_count = 2
        ignore = hand_ignore(hand_play,unique,rank_dupe,card_count)
        return "Pair"
    elseif #unique == 3 and unique[3] == 2 then
        card_count = 2
        ignore = hand_ignore(hand_play,unique,rank_dupe,card_count)
        return "Pair"
    elseif #unique == 4 and unique[4] == 2 then
        card_count = 2
        ignore = hand_ignore(hand_play,unique,rank_dupe,card_count)
        return "Pair"
    end

    ignore = {}
    local count = 0
    for i,v in ipairs(hand_play) do
        if v == "st" then
            count = count +1
        end
    end
    for i,v in ipairs(hand_play) do
        if position(string.sub(v,1,1)) ~= ranked[#ranked-count] and v ~= "st" then
            table.insert(ignore,v)
        end
    end
    return "High Card"
end

function on_play_jokers(joker,joker_index)
    if joker == "To do List" then
        if hand_type == jokers_enhancement[joker_index][1] then
            cash = cash + 4
        end
    elseif joker == "Midas Mask" then
        for j,k in ipairs(hand) do
            if string.sub(k,1,1) == "k" or string.sub(k,1,1) == "q" or string.sub(k,1,1) == "j" then
                local index = find_matching(j,hand,hand_enhancement)
                for i=2,#hand_enhancement[j] do
                    if enhancement_info[hand_enhancement[j][i]][2] == "Enhancment" and i<#hand_enhancement[j] then
                        table.remove(hand_enhancement[j],i)
                        table.remove(full_deck_enhancement[index],i)
                        break
                    end
                end
                table.insert(full_deck_enhancement[index],"Gold")
                --table.insert(hand_enhancement[j],"Gold")
            end
        end
    elseif joker == "Space Joker" then
        local rand = math.random()
        if rand < 0.25 then
            for k,v in pairs(planets_info) do
                if v[3] == hand_type then
                    hand_multipliers[v[3]][1] = hand_multipliers[v[3]][1] + v[1]
                    hand_multipliers[v[3]][2] = hand_multipliers[v[3]][2] + v[2]
                    break
                end
            end
        end
    elseif joker == "DNA" then
        if #hand==1 and hands == max_hands -1 then
            table.insert(full_deck,hand[1])
            table.insert(full_deck_enhancement,hand_enhancement[1])
            table.insert(dealt,hand[1])
            table.insert(dealt,hand_enhancement[1])
        end
    elseif joker == "Blueprint" then
        if joker_index ~= #jokers then
            on_play_jokers(jokers[joker_index+1],joker_index+1)
        end
    elseif joker == "Brainstorm" then
        if joker_index ~=1 then
            on_play_jokers(jokers[1],1)
        end
    end
end

function per_card_joker(joker,joker_index, card, card_index)
    local per_card_used = false
    if joker == "Wrathful Joker" then
        if string.sub(card, 2, 2) == "s" then
            multiplier = multiplier + 3
            per_card_used = true
        end
    elseif joker == "Greedy Joker" then
        if string.sub(card, 2, 2) == "d" then
            multiplier = multiplier + 3
            per_card_used = true
        end
    elseif joker == "Lusty Joker" then
        if string.sub(card, 2, 2) == "h" then
            multiplier = multiplier + 3
            per_card_used = true
        end
    elseif joker == "Gluttonous Joker" then
        if string.sub(card, 2, 2) == "c" then
            multiplier = multiplier + 3
            per_card_used = true
        end
    elseif joker == "Business Card" then
        if string.sub(card,1,1) == "j" or string.sub(card,1,1) == "q" or string.sub(card,1,1) == "k" then
            local rand = math.random()
            if rand <0.5 then
                cash = cash + 2
            end
            per_card_used = true
        end
    elseif joker == "8 ball" then
        if string.sub(card,1,1) == "8" then
            local rand = math.random()
            if rand < 0.25 and #consumable < consumable_size then
                local rand_tarot = math.random(#tarots_deck)
                table.insert(consumable,tarots_deck[rand_tarot])
                table.insert(consumable_enhancement," ")
            end
            per_card_used = true
        end
    elseif joker == "Scholar" then
        if string.sub(card,1,1) == "a" then
            chips = chips + 20
            multiplier = multiplier + 4
            per_card_used = true
        end
    elseif joker == "Scary Face" then
        if string.sub(card,1,1) == "j" or string.sub(card,1,1) == "q" or string.sub(card,1,1) == "k" then
            chips = chips + 30
            per_card_used = true
        end
    elseif joker == "Smiley Face" then
        if string.sub(card,1,1) == "j" or string.sub(card,1,1) == "q" or string.sub(card,1,1) == "k" then
            multiplier = multiplier + 5
            per_card_used = true
        end
    elseif joker == "Walkie Talkie" then
        if string.sub(card,1,1) == "t" or string.sub(card,1,1) == "4" then
            chips = chips + 10
            multiplier = multiplier + 4
            per_card_used = true
        end
    elseif joker == "Even Steven" then
        local num = convert_rank_to_num(string.sub(card,1,1))
        if string.sub(card,1,1) ~= "k" and string.sub(card,1,1) ~= "q" and string.sub(card,1,1) ~= "j" then
            if num%2 == 0 then
                multiplier = multiplier + 4
                per_card_used = true
            end
        end
    elseif joker == "Odd Todd" then
        local num = convert_rank_to_num(string.sub(card,1,1))
        if num%2 == 1  then
            chips = chips + 31
            per_card_used = true
        end
    elseif joker == "Photograph" then
        if string.sub(card,1,1) == "j" or string.sub(card,1,1) == "q" or string.sub(card,1,1) == "k" then
            for i=1, card_index-1 do
                if string.sub(hand[i],1,1) == "j" or string.sub(hand[i],1,1) == "q" or string.sub(hand[i],1,1) == "k" then
                    break
                end
                if i == card_index-1 then
                    multiplier = multiplier*2
                    per_card_used = true
                end
            end
        end
    elseif joker == "Golden Ticket" then
        for i,v in ipairs(hand) do
            for j,k in ipairs(hand_enhancement[i]) do
                if k == "Gold" then
                    cash = cash + 4
                    per_card_used = true
                end
            end
        end
    elseif joker == "Fibonacci" then
        if string.sub(card,1,1) == "a" or string.sub(card,1,1) == "2" or string.sub(card,1,1) == "3" or string.sub(card,1,1) == "5" or string.sub(card,1,1) == "8" then
            multiplier = multiplier + 8
            per_card_used = true
        end
    elseif joker == "Vampire" then
        for i=2, #hand_enhancement[card_index] do
            local v = hand_enhancement[card_index][#hand_enhancement[card_index]+2-i]--doing from top down
            jokers_enhancement[joker_index][1] = jokers_enhancement[joker_index][1] + 0.1
            per_card_used = true
            if v == "Stone" then
                local new_card = standard_deck[math.random(#standard_deck)]
                hand_enhancement[card_index][1] = hand_enhancement[card_index][1] - convert_rank_to_num(string.sub(card,1,1)) + convert_rank_to_num(string.sub(new_card,1,1))
                hand[#hand_enhancement[card_index]+2-i] = new_card
                table.remove(hand,card_index)
            end
            table.remove(hand_enhancement[card_index],#hand_enhancement[card_index]+2-i)
        end
    elseif joker == "The Idol" then
        if card == jokers_enhancement[joker_index][1] then
            multiplier = multiplier*2
            per_card_used = true
        end
    elseif joker == "Onyx Agate" then
        if string.sub(card,2,2) == "c" then
            multiplier = multiplier + 7
            per_card_used = true
        end
    elseif joker == "Arrowhead" then
        if string.sub(card,2,2) == "s" then
            chips = chips + 50
            per_card_used = true
        end
    elseif joker == "Bloodstone" then
        if string.sub(card,2,2) == "g" then
            local rand = math.random()
            if rand<0.5 then
                multiplier = multiplier*1.5
            end
            per_card_used = true
        end
    elseif joker == "Rough Gem" then
        if string.sub(card,2,2) == "d" then
            cash = cash +1
            per_card_used = true
        end
    elseif joker == "Ancient Joker" then
        if string.sub(card,1,1) == jokers_enhancement[joker_index][1] then
            mult = mult *1.5
            per_card_used = true
        end
    elseif joker == "Wee Joker" then
        if string.sub(card,1,1) == "2" then
            jokers_enhancement[joker_index][1] = jokers_enhancement[joker_index][1] + 8
            per_card_used = true
        end
    elseif joker == "Triboulet" then
        if string.sub(card,1,1) == "k" or string.sub(card,1,1) == "q" then
            multiplier = multiplier*2
            per_card_used = true
        end
    elseif joker == "Blueprint" then
        if joker_index ~= #jokers then
            per_card_joker(jokers[joker_index+1],joker_index+1,card,card_index)
            per_card_used = true
        end
    elseif joker == "Brainstorm" then
        if joker_index ~=1 then
            per_card_joker(jokers[1],1,card,card_index)
            per_card_used = true
        end
    end
    if per_card_used then-- not working with brainstorm or blueprint
        played_enhancement(jokers_enhancement[joker_index])
    end
end

function final_jokers(joker,joker_index) 
    local held_used = false
    if joker == "Jolly Joker" then
        if conatins_pair == true then
            multiplier = multiplier + 8
            held_used = true
        end
    elseif joker == "Zany Joker" then
        if contains_3 == true then
            multiplier = multiplier + 12
            held_used = true
        end
    elseif joker == "Mad Joker" then
        if contains_2pair == true then
            multiplier = multiplier + 10
            held_used = true
        end
    elseif joker == "Crazy Joker" then
        if straight == true then
            multiplier = multiplier + 12
            held_used = true
        end
    elseif joker == "Droll Joker" then
        if flush == true then
            multiplier = multiplier + 10
            held_used = true
        end
    elseif joker == "Sly Joker" then
        if conatins_pair == true then
            chips = chips + 50
            held_used = true
        end
    elseif joker == "Clever Joker" then
        if contains_2pair == true then
            chips = chips + 80
            held_used = true
        end
    elseif joker == "Half Joker" then
        if #hand < 4 then
            multiplier = multiplier + 20
            held_used = true
        end
    elseif joker == "Willy Joker" then
        if contains_3 == true then
            chips = chips + 100
            held_used = true
        end
    elseif joker == "Crafty Joker" then
        if flush == true then
            chips = chips +80
            held_used = true
        end
    elseif joker == "Runner" then
        if straight == true then
            jokers_enhancement[joker_index][1] = jokers_enhancement[joker_index][1] +15
            chips = chips + jokers_enhancement[joker_index][1]
            held_used = true
        end
    elseif joker == "Mystic Summit" then
        if discards == 0 then
            multiplier = multiplier + 15 
            held_used = true
        end
    elseif joker == "Misprint" then
        chips = chips + math.random(0,23)
        held_used = true
    elseif joker == "Devious Joker" then
        if straight == true then
            chips = chips +100
            held_used = true
        end
    elseif joker == "Blue Joker" then
        chips = chips + 2*#deck
        held_used = true
    elseif joker == "Green Joker" then
        jokers_enhancement[joker_index][1] = jokers_enhancement[joker_index][1] +1
        multiplier = multiplier + jokers_enhancement[joker_index][1] 
        held_used = true
    elseif joker == "Joker" then
        multiplier = multiplier + 4
        held_used = true
    elseif joker == "Gros Michel" then
        multiplier = multiplier + 15
        held_used = true
    elseif joker == "Joker Stencil" then
        multiplier = multiplier * (5 - #jokers)
        held_used = true
    elseif joker == "Abstract Joker" then
        multiplier = multiplier + 3*#jokers
        held_used = true
    elseif joker == "Banner" then
        chips = chips + (discards * 30)
        held_used = true
    elseif joker == "Supernova" then
        multiplier  = multiplier + hand_multipliers[hand_type][3]
        held_used = true
    elseif joker == "Swashbuckler" then
        local tot = 0
        for i,v in ipairs(jokers_enhancement) do
            if i ~= joker_index then
                tot = tot + v[2]
            end
        end
        multiplier = multiplier + tot
        held_used = true
    elseif joker == "Red Card" then
        multiplier = multiplier + jokers_enhancement[joker_index][1]
    elseif joker == "Superposition" then
        if straight == true then
            local i = 0
            repeat
                i = i+1
            until string.sub(hand[i],1,1) == "a" or i==#hand
            if string.sub(hand[i],1,1) == "a" and #consumable < consumable_size then
                local rand = math.random(#tarots_deck)
                table.insert(consumable,tarots_deck[rand])
                table.insert(consumable_enhancement," ")
                held_used = true
            end
        end
    elseif joker == "Fortune Teller" then
        multiplier = multiplier+(total_consumable-total_planets)
        held_used = true
    elseif joker == "Cavendish" then
        multiplier = multiplier*3
        held_used = true
    elseif joker == "Square Joker" then
        if #hand == 4 then
            jokers_enhancement[joker_index][1] = jokers_enhancement[joker_index][1] + 4
        end
        chips = chips + jokers_enhancement[joker_index][1]
        held_used = true
    elseif joker == "Ice Cream" then
        chips = chips + jokers_enhancement[joker_index][1]
        jokers_enhancement[joker_index][1] = jokers_enhancement[joker_index][1] - 5
        held_used = true
        if jokers_enhancement[joker_index][1] == 0 then
            removal_joker(joker,joker_index)
        end
    elseif joker == "Ride the Bus" then
            local count = 0
            for i,v in ipairs(hand) do
                if string.sub(v,1,1) ~= "k" and string.sub(v,1,1) ~= "q" and string.sub(v,1,1) ~= "j" then
                    count = count + 1
                end
            end
            if count == #hand then
                jokers_enhancement[joker_index][1][2] = jokers_enhancement[joker_index][1][2] + 1
                jokers_enhancement[joker_index][1][1] = jokers_enhancement[joker_index][1][1] + jokers_enhancement[joker_index][1][2]
            else
                jokers_enhancement[joker_index][1][2] = 0
            end
        multiplier = multiplier + jokers_enhancement[joker_index][1][1]
        held_used = true
    elseif joker == "Loyalty Card" then
        jokers_enhancement[joker_index][1] = jokers_enhancement[joker_index][1]-1
        if jokers_enhancement[joker_index][1] == 0 then
            multiplier = multiplier * 4
        end
        held_used = true
    elseif joker == "Stone Joker" then
        local count = 0
        for i,v in ipairs(full_deck_enhancement) do
            for j,k in ipairs(v) do
                if k == "Stone" then
                    count = count + 1
                end
            end
        end
        chips = chips+25*count
        held_used = true
    elseif joker == "Steel Joker" then
        local count = 0
        for i,v in ipairs(full_deck_enhancement) do
            for j,k in ipairs(v) do
                if k == "Steel" then
                    count = count + 1
                end
            end
        end
        multiplier = multiplier*(1+0.2*count)
        held_used = true
    elseif joker == "Sixth Sense" then
        if #hand == 1 and string.sub(hand[1],1,1) == "6" and hands == max_hands-1 then
            if #consumable<consumable_size then
                table.insert(consumable,spectral_deck[math.random(#spectral_deck)])
                table.insert(consumable_enhancement," ")
                local index = find_matching(1,hand,hand_enhancement)
                for i,v in ipairs(jokers) do
                    card_destroyed(v,i,hand[1],hand_enhancement[1])
                end
                table.remove(full_deck,index)
                table.remove(full_deck_enhancement,index)
                held_used = true
            end
        end
    elseif joker == "Blackboard" then
        local count = 0
        for i,v in ipairs(dealt) do
            if string.sub(v,2,2) == "s" or string.sub(v,2,2) == "c" then
                count = count +1
            end
        end
        if count == #dealt then
            multiplier=multiplier*3
            held_used = true
        end
    elseif joker == "Constellation" then
        multiplier = multiplier*(1+0.1*total_planets)
        held_used = true
    elseif joker == "Card Sharp" then
        local count = 0
        for i,v in ipairs(played_hand_type) do
            if v == hand_type then
                count = count +1
            end
        end
        if count >1 then--needs to be >1 as it counts itself
            multiplier = multiplier*3
            held_used = true
        end
    elseif joker == "Seance" then
        if straight and flush then
            if #consumable<consumable_size then
                table.insert(consumable,spectral_deck[math.random(#spectral_deck)])
                table.insert(consumable_enhancement," ")
                held_used = true
            end
        end
    elseif joker == "Vampire" then
        multiplier = multiplier*(1+jokers_enhancement[joker_index][1])
        held_used = true
    elseif joker == "Erosion" then
        if #full_deck>deck_size then
            multiplier = multiplier+4*(#full_deck-deck_size)
            held_used = true
        end
    elseif joker == "Bull" then
        chips = chips+2*cash
        held_used = true
    elseif joker == "Bootstraps" then
        multiplier = multiplier+2*math.floor(cash/5)
        held_used = true
    elseif joker == "Seeing Double" then
        local has_club = false
        local has_other = false
        for i,v in ipairs(hand) do
            if string.sub(v,2,2) == "c" then
                has_club = true
            elseif string.sub(v,2,2) == "h" or string.sub(v,2,2) == "d" or string.sub(v,2,2) == "s" then
                has_other = true
            end
        end
        if has_club and has_other then
            multiplier = multiplier*2
            held_used = true
        end
    elseif joker == "Flower Pot" then
        if #hand >3 then
            local clubs = false
            local spades = false
            local diamonds = false
            local hearts = false
            for i, v in ipairs(hand) do
                if string.sub(v,2,2) == "h" then
                    hearts = true
                elseif string.sub(v,2,2) == "d" then
                    diamonds = true
                elseif string.sub(v,2,2) == "s" then
                    spades = true
                elseif string.sub(v,2,2) == "c" then
                    clubs = true
                end
            end
            if hearts and diamonds and spades and clubs then
                multiplier = multiplier*3
                held_used = true
            end
        end
    elseif joker == "Acrobat" then
        if hands == 0 then
            multiplier = multiplier*3
            held_used = true
        end
    elseif joker == "Throwback" then
        multiplier = multiplier*(1+0.25*no_blinds_skipped)
        held_used = true
    elseif joker == "Castle" then
        chips = chips + jokers_enhancement[joker_index][1][2]
        held_used = true
    elseif joker == "Spare Trousers" then
        if contains_2pair then
            jokers_enhancement[joker_index][1] =jokers_enhancement[joker_index][1]+2
        end
        multiplier = multiplier+jokers_enhancement[joker_index][1]
        held_used = true
    elseif joker == "The Duo" then
        if conatins_pair then
            multiplier = multiplier*2
            held_used = true
        end
    elseif joker == "The Trio" then
        if contains_3 then
            multiplier = multiplier*3
            held_used = true
        end
    elseif joker == "The Family" then
        if contains_4 then
            multiplier = multiplier*4
            held_used = true
        end
    elseif joker == "The Order" then
        if straight then
            multiplier = multiplier*3
            held_used = true
        end
    elseif joker == "The Tribe" then
        if flush then
            multiplier = multiplier*2
            held_used = true
        end
    elseif joker == "Stuntman" then
        chips = chips +250
        held_used = true
    elseif joker == "Driver's License" then
        local count = 0
        for i,v in ipairs(full_deck_enhancement) do
            if type(v) == "string" and string.len(v)>0 then
                count = count +1
            end
        end
        if count >15 then
            multiplier = multiplier*3
            held_used = true
        end
    elseif joker == "Campfire" then
        multiplier = multiplier+jokers_enhancement[joker_index][1]
        held_used = true
    elseif joker == "Vagabond" then
        if cash < 5 and #consumable < consumable_size then
            table.insert(consumable,tarots_deck[math.random(#tarots_deck)])
            table.insert(consumable_enhancement," ")
            held_used = true
        end
    elseif joker == "Wee Joker" then
        chips = chips + jokers_enhancement[joker_index][1]
        held_used = true
    elseif joker == "Obelisk" then
        local hand_num = hand_multipliers[hand_type][3]
        local max_hand = true
        for k,v in pairs(hand_multipliers) do
            if v[3] >= hand_num and k ~= hand_type then
                max_hand = false
            end
        end
        if max_hand == false then
            jokers_enhancement[joker_index][2] = jokers_enhancement[joker_index][2] +0.2
            jokers_enhancement[joker_index][1] = jokers_enhancement[joker_index][1] + jokers_enhancement[joker_index][2]
            held_used = true
        else
            jokers_enhancement[joker_index][2] = 0
        end
    elseif joker == "Hit the Road" then
        multiplier = multiplier*jokers_enhancement[joker_index][1]
        held_used = true
    elseif joker == "Canio" then
        multiplier = multiplier*jokers_enhancement[joker_index][1]
        held_used = true
    elseif joker == "Yorick" then
        multiplier = multiplier*jokers_enhancement[joker_index][1][1]
        held_used = true
    elseif joker == "Blueprint" then
        if joker_index ~= #jokers then
            final_jokers(jokers[joker_index+1],joker_index+1)
            held_used = true
        end
    elseif joker == "Brainstorm" then
        if joker_index ~=1 then
            final_jokers(jokers[1],1)
            held_used = true
        end
    end
    if held_used then
        played_enhancement(jokers_enhancement[joker_index])--has foil holo and poly
    end
end

function held_jokers(joker,joker_index)
    local held_used = false
    if joker == "Raised Fist" then
        local lowest = convert_rank_to_num(string.sub(dealt[1],1,1))
        for i=2, #dealt do
            local current = convert_rank_to_num(string.sub(dealt[i],1,1))
            if current<lowest then
                lowest = current
            end
        end
        multiplier = multiplier + 2*lowest
        held_used = true
    elseif joker == "Reserved Parking" then
        for i,v in ipairs(dealt) do
            if string.sub(v,1,1) == "j" or string.sub(v,1,1) == "q" or string.sub(v,1,1) == "k" then
                local rand = math.random()
                if rand <0.5 then
                    cash =cash +1
                end
                held_used = true
            end
        end
    elseif joker == "Shoot the Moon" then
        for i,v in ipairs(dealt) do
            if string.sub(v,1,1) == "q" then
                multiplier = multiplier + 13
                held_used = true
            end
        end
    elseif joker == "Baron" then
        for i,v in ipairs(dealt) do
            if string.sub(v,1,1) == "k" then
                multiplier = multiplier*1.5
                held_used = true
            end
        end
    elseif joker == "Blueprint" then
        if joker_index ~= #jokers then
            held_jokers(jokers[joker_index+1],joker_index+1)
            held_used = true
        end
    elseif joker == "Brainstorm" then
        if joker_index ~=1 then
            held_jokers(jokers[1],1)
            held_used = true
        end
    end
    if held_used then
        played_enhancement(jokers_enhancement[joker_index])
    end
end

function round_end_jokers(joker,index)  
    if joker == "Golden Joker" then
        cash = cash + 4
    elseif joker == "Popcorn" then
        if jokers_enhancement[index][1] >0 then
            jokers_enhancement[index][1] = jokers_enhancement[index][1] - 4
        elseif jokers_enhancement[index][1] == 0 then
            removal_joker(joker,index)
        end
    elseif joker == "Egg" then
        jokers_enhancement[index][2] = jokers_enhancement[index][2] + 3
    elseif joker == "Delayed Gratification" then
        if discards == max_discards then
            cash = cash + 2*max_discards
        end
    elseif joker == "Gros Michel" then
        local rand = math.random(6)
        if rand == 1 then
            table.remove(jokers,index)
            table.insert(common_joker,"Cavendish")
        end
    elseif joker == "Cavendish" then
        local rand = math.random()
        if rand < 0.001 then
            table.remove(jokers,index)
        end
    elseif joker == "To do List" then
        local poker_hand = planets_info[planets_deck[math.random(2,#planets_deck)]][3]
        jokers_enhancement[index][1] = poker_hand
    elseif joker == "Mail in Rebate" then
        local card = full_deck[math.random(#full_deck)]
        local rank = string.sub(card,1,1)
        jokers_enhancement[index][1] = rank
    elseif joker == "Rocket" then
        if blind == 3 then
            jokers_enhancement[index][1] = jokers_enhancement[index][1] + 2
        end
        cash = cash + jokers_enhancement[index][1]
    elseif joker == "Cloud 9" then
        local count = 0
        for i,v in ipairs(full_deck) do
            if string.sub(v,1,1) == "9" then
                count = count + 1
            end
        end
        cash =cash + count
    elseif joker == "Gift Card" then
        for i,v in ipairs(jokers_enhancement) do
            jokers_enhancement[i][2] = v[2] + 1
        end
    elseif joker == "Invisible Joker" then
        jokers_enhancement[index][1] = jokers_enhancement[index][1] + 1
    elseif joker == "Turtle Bean" then
        if jokers_enhancement[index][1]>0 then
            jokers_enhancement[index][1] = jokers_enhancement[index][1] - 1
        elseif jokers_enhancement[index][1] == 0 then
            removal_joker(joker,index)
        end
    elseif joker == "Castle" then
        local rand_suit = string.sub(standard_deck[math.random(#standard_deck)],2,2)
        jokers_enhancement[index][1][1] = rand_suit
    elseif joker == "The Idol" then
        local rand_card = full_deck[math.random(#full_deck)]
        jokers_enhancement[index][1] = rand_card
    elseif joker == "To the Moon" then
        cash = cash+ math.Clamp(math.floor(cash / 5), 0, max_interest)
    end

    for i,v in ipairs(jokers_enhancement[index]) do
        if type(v) == "table" then
            if v[1] == "Perishable" then
                jokers_enhancement[index][i][2] = v[2] -1
                if jokers_enhancement[index][i][2] == 0 then
                    table.remove(jokers_enhancement,index)
                    table.remove(jokers,index)
                end
            end
        else
            if v == "Rental" then
                cash = cash - 3
            end
        end
    end
end

function shop_end_jokers(joker, index)
    if joker == "Perkeo" then
        if #consumable>0 then
            local rand = math.random(#consumable)
            consumable_size = consumable_size+1
            table.insert(consumable,consumable[rand])
            table.insert(consumable_enhancement,"Negative")
        end
    elseif joker == "Blueprint" then
        if index ~= #jokers then
            shop_end_jokers(jokers[index+1],index+1)
        end
    elseif joker == "Brainstorm" then
        if index ~=1 then
            shop_end_jokers(jokers[1],1)
        end
    end
end

function discard_jokers(joker,joker_index)
    if joker == "Faceless Joker" then
        local count = 0 
        for i,v in ipairs(hand) do
            if string.sub(v,1,1) == "j" or string.sub(v,1,1) == "q" or string.sub(v,1,1) == "k" then
                count = count +1
            end
        end
        if count >2 then
            cash = cash + 5
        end
    elseif joker == "Green Joker" then
        if jokers_enhancement[joker_index][1] > 0 then
            jokers_enhancement[joker_index][1] = jokers_enhancement[joker_index][1] - 1
        end
    elseif joker == "Mail in Rebate" then
        for i,v in ipairs(hand) do
            if string.sub(v,1,1) == jokers_enhancement[joker_index][1] then-- not always working
                cash = cash + 5
            end
        end
    elseif joker == "Castle" then
        for i,v in ipairs(hand) do
            if string.sub(v,2,2) == jokers_enhancement[joker_index][1][1] then
                jokers_enhancement[joker_index][1][2] = jokers_enhancement[joker_index][1][2] +3
            end
        end
    elseif joker == "Trading Card" then
        if discards==max_discards and #hand ==1 then
            local full_index = find_matching(1,hand,hand_enhancement)
            for i,v in ipairs(jokers) do
                card_destroyed(v,i,hand[1],hand_enhancement[1])
            end
            table.remove(full_deck,full_index)
            table.remove(full_deck_enhancement,full_index)
            cash = cash+3
        end
    elseif joker == "Ramen" then
        for i,v in ipairs(hand) do
            if jokers_enhancement[joker_index][1] >0 then
                jokers_enhancement[joker_index][1] = jokers_enhancement[joker_index][1]-0.01
            elseif jokers_enhancement[joker_index][1] == 0 then
                removal_joker(joker,joker_index)
            end
        end
    elseif joker == "Burnt Joker" then
        if discards == max_discards then
            local planet = hand_multipliers[hand_type][4]
            hand_multipliers[hand_type][1] = hand_multipliers[hand_type][1] + planets_info[planet][1]
            hand_multipliers[hand_type][2] = hand_multipliers[hand_type][2] + planets_info[planet][2]
        end
    elseif joker == "Hit the Road" then
        for i,v in ipairs(hand) do
            if string.sub(v,1,1) == "j" then
                jokers_enhancement[joker_index][1] = jokers_enhancement[joker_index][1] + 0.5
            end
        end
    elseif joker == "Yorick" then
        for i,v in ipairs(hand) do
            if jokers_enhancement[joker_index][1][2]>1 then
                jokers_enhancement[joker_index][1][2] = jokers_enhancement[joker_index][1][2] - 1
            else
                jokers_enhancement[joker_index][1][1] = jokers_enhancement[joker_index][1][1]+1
                jokers_enhancement[joker_index][1][2] = 23
            end
        end
    elseif joker == "Blueprint" then
        if joker_index ~= #jokers then
            discard_jokers(jokers[joker_index+1],joker_index+1)
        end
    elseif joker == "Brainstorm" then
        if joker_index ~=1 then
            discard_jokers(jokers[1],1)
        end
    end
end

function selected_blind_jokers(joker,index)
    sale_possible = true
    if joker == "Riff-Raff" then
        local rand
        for i=1,2 do
            repeat
                rand = math.random(#common_joker)
            until common_joker[rand] ~= "Riff-Raff"--not possible to get itself
            if #jokers<joker_size then
                local addition = {}
                for j,k in ipairs(stickers) do
                    addition = add_stickers(k,addition)
                end
                add_jokers_to_selection(common_joker[rand],addition)
            end
        end
    elseif joker == "Marble Joker" then
        table.insert(full_deck,"st")
        table.insert(full_deck_enhancement,{50})
    elseif joker == "Burglar" then
        hands = hands+3
        discards = 0
    elseif joker == "Ceremonial Dagger" then
        if#jokers>1 and index<#jokers then
            for i,v in ipairs(jokers_enhancement[index+1]) do
                if v == "Eternal" then
                    sale_possible = false
                end
            end
            jokers_enhancement[index][1] = jokers_enhancement[index][1] + 2*jokers_enhancement[index+1][2]
            if sale_possible then
                removal_joker(jokers[index+1],index+1)
            end
        end
    elseif joker == "Madness" then
        if blind <3 then
            if #jokers>1 then
                repeat
                    local rand = math.random(#jokers)
                until rand ~= index
                for i,v in ipairs(jokers_enhancement[rand]) do
                    if v == "Eternal" then
                        sale_possible = false
                    end
                end
                if sale_possible then
                    removal_joker(jokers[rand])
                end
                jokers_enhancement[index][1] = jokers_enhancement[index][1] +0.5
            end
        end
    elseif joker == "Certificate" then
        local playing_card = standard_deck[math.random(#standard_deck)]
        local rand_seal = seals[math.random(#seals)]
        local num = convert_rank_to_num(string.sub(playing_card,1,1))
        table.insert(dealt,playing_card)
        table.insert(dealt_enhancement,{num,rand_seal})
    elseif joker == "Cartomancer" then
        if #consumable<consumable_size then
            table.insert(consumable,tarots_deck[math.random(#tarots_deck)])
            table.insert(consumable_enhancement," ")
        end
    elseif joker == "Blueprint" then
        if index ~= #jokers then
            selected_blind_jokers(jokers[index+1],index+1)
        end
    elseif joker == "Brainstorm" then
        if index ~=1 then
            selected_blind_jokers(jokers[1],1)
        end
    end
end

function sell_jokers(joker,index)
    sale_possible = true
    for i,v in ipairs(jokers_enhancement[index]) do
        if v == "Eternal" then
            sale_possible = false
        end
    end
    if sale_possible then
        if joker == "Diet Cola" then
            table.insert(tag_select,"Double")
        elseif joker == "Invisible Joker" then
            if jokers_enhancement[index][1] > 1 and #jokers>0 then
                local rand 
                repeat 
                    rand = math.random(#jokers)
                until rand ~= index
                add_jokers_to_selection(jokers[rand],jokers_enhancement[rand])
            end
        end
        cash = cash + jokers_enhancement[index][2]
        removal_joker(joker,index)
        joker_sale = true--for a finisher blind
    end
end

function removal_joker(joker,index)--done for stuff like dagger/madness
    if joker == "Juggler" then
        max_hand_size = max_hand_size-1
    elseif joker == "Drunkard" then
        max_discards = max_discards - 1
    elseif joker == "Credit Card" then
        min_cash = 0
    elseif joker == "Merry Andy" then
        max_discards = max_discards-3
        max_hand_size = max_hand_size+1
    elseif joker == "Troubadour" then
        max_hand_size = max_hand_size-2
        max_hands = max_hands+1
    elseif joker == "Turtle Bean" then
        max_hand_size = max_hand_size-jokers_enhancement[index][1]
    elseif joker == "Stuntman" then
        max_hand_size = max_hand_size+2
    elseif joker == "Chicot" then
        boss_active = false
    end
    for i,v in ipairs(jokers_enhancement[index]) do
        if v == "Negative" then
            joker_size = joker_size-1
        end
    end
    table.remove(jokers,index)
    table.remove(jokers_enhancement,index)
end

function add_jokers_to_selection(initial,initial_enhancement)--adding needed values at the start of the enhancement
    table.insert(jokers,initial)
    table.insert(jokers_enhancement,{})
    if initial == "Ice Cream" then
        table.insert(jokers_enhancement[#jokers_enhancement],100)
    elseif initial == "Popcorn" then
        table.insert(jokers_enhancement[#jokers_enhancement],20)
    elseif initial == "Chaos the Clown" then
        table.insert(jokers_enhancement[#jokers_enhancement],"")
        reroll_price = 0
    elseif initial == "Credit Card" then
        table.insert(jokers_enhancement[#jokers_enhancement],"")
        min_cash = -20
    elseif initial == "Red Card" then
        table.insert(jokers_enhancement[#jokers_enhancement],0)
    elseif initial == "To do List" then
        local poker_hand = planets_info[planets_deck[math.random(#planets_deck)]][3]
        table.insert(jokers_enhancement[#jokers_enhancement],poker_hand)
    elseif initial == "Ride the Bus" then
        table.insert(jokers_enhancement[#jokers_enhancement],{0,0})--current mult,mult to add
    elseif initial == "Runner" then
        table.insert(jokers_enhancement[#jokers_enhancement],0)
    elseif initial == "Square Joker" then
        table.insert(jokers_enhancement[#jokers_enhancement],0)
    elseif initial == "Juggler" then
        table.insert(jokers_enhancement[#jokers_enhancement],"")
        max_hand_size = max_hand_size + 1
    elseif initial == "Drunkard" then
        table.insert(jokers_enhancement[#jokers_enhancement],"")
        max_discards = max_discards + 1
    elseif initial == "Green Joker" then
        table.insert(jokers_enhancement[#jokers_enhancement],0)
    elseif initial == "Vampire" then
        table.insert(jokers_enhancement[#jokers_enhancement],0)
    elseif initial == "Mail in Rebate" then
        local rank = convert_num_to_rank(math.random(2,14))
        table.insert(jokers_enhancement[#jokers_enhancement],rank)
    elseif initial == "Ceremonial Dagger" then
        table.insert(jokers_enhancement[#jokers_enhancement],0)
    elseif initial == "Loyalty Card" then
        table.insert(jokers_enhancement[#jokers_enhancement],6)
    elseif initial == "Rocket" then
        table.insert(jokers_enhancement[#jokers_enhancement],1)
    elseif initial == "Turtle Bean" then
        table.insert(jokers_enhancement[#jokers_enhancement],5)
    elseif initial == "Spare Trousers" then
        table.insert(jokers_enhancement[#jokers_enhancement],0)
    elseif initial == "Ramen" then
        table.insert(jokers_enhancement[#jokers_enhancement],2)
    elseif initial == "Castle" then
        local rand_suit = string.sub(standard_deck[math.random(#standard_deck)],2,2)
        table.insert(jokers_enhancement[#jokers_enhancement],{rand_suit,0})
    elseif initial == "The Idol" then
        local rand_card = full_deck[math.random(#full_deck)]
        table.insert(jokers_enhancement[#jokers_enhancement],rand_card)
    elseif initial == "Merry Andy" then
        table.insert(jokers_enhancement[#jokers_enhancement],"")
        max_discards = max_discards+3
        max_hand_size = max_hand_size-1
    elseif initial == "Troubadour" then
        table.insert(jokers_enhancement[#jokers_enhancement],"")
        max_hand_size = max_hand_size+2
        max_hands = max_hands-1
    elseif initial == "Obelisk" then
        table.insert(jokers_enhancement[#jokers_enhancement],{1,0})
    elseif initial == "Campfire" then
        table.insert(jokers_enhancement[#jokers_enhancement],{1,0})
    elseif initial == "Wee Joker" then
        table.insert(jokers_enhancement[#jokers_enhancement],0)
    elseif initial == "Hit the Road" then
        table.insert(jokers_enhancement[#jokers_enhancement],1)
    elseif initial == "Stuntman" then
        table.insert(jokers_enhancement[#jokers_enhancement],"")
        max_hand_size = max_hand_size-2
    elseif initial == "Invisible Joker" then
        table.insert(jokers_enhancement[#jokers_enhancement],0)
    elseif initial == "Canio" then
        table.insert(jokers_enhancement[#jokers_enhancement],1)
    elseif initial == "Yorick" then
        table.insert(jokers_enhancement[#jokers_enhancement],{1,23})
    elseif initial == "Chicot" then
        table.insert(jokers_enhancement[#jokers_enhancement],"")
        boss_active = false
    else
        table.insert(jokers_enhancement[#jokers_enhancement]," ")
    end
    table.insert(jokers_enhancement[#jokers_enhancement],math.floor(joker_info[initial][1]*discount_percent/2))
    for i=2,#initial_enhancement do
        local v = initial_enhancement[i]
        if v == "Negative" then
            joker_size = joker_size+1
        end
        if v =="Perishable" then
            table.insert(jokers_enhancement[#jokers_enhancement],{v,5})
        else
            table.insert(jokers_enhancement[#jokers_enhancement],v)
        end
    end
end

function card_destroyed(joker, joker_index,card,card_enhancement)
    local rank = string.sub(card,1,1)
    local suit = string.sub(card,2,2)
    if joker == "Canio" then
        if rank == "k" then
            jokers_enhancement[joker_index][1] = jokers_enhancement[joekr_index][1] +1
        end
    elseif joker == "Glass Joker" then
        for i,v in ipairs(card_enhancement) do
            if v == "Glass" then
                jokers_enhancement[joker_index][1] = jokers_enhancement[joker_index][1] +0.75
            end
        end
    elseif joker == "Blueprint" then
        if joker_index ~= #jokers then
            card_destroyed(jokers[joker_index+1],joker_index+1,card,card_enhancement)
        end
    elseif joker == "Brainstorm" then
        if joker_index ~=1 then
            card_destroyed(jokers[1],1,card,card_enhancement)
        end
    end
end

function calculate_minimum_score()
    for i =1, #blind_multis do
        minimumscore[i] = ante_bases[ante] * blind_multis[i]
        if deck_name == "Plasma" then
            minimumscore[i] = 2*minimumscore[i]
        end
    end
    local num = ante /8
    if math.floor(num) ~= num then
        if boss_blind[boss_num] == "The Wall" then
            minimumscore[3] = minimumscore[3]*2--look at later it re-runs when the boss is rerolled but only the last one needs to
        elseif boss_blind[boss_num] == "The Needle" then
            minimumscore[3] = minimumscore[3]/2
        end
    else
        if finisher_blinds[boss_num] == "Violet Vessel" then
            minimumscore[3] = minimumscore[3]*3
        end
    end
end

function convert_rank_to_num(rank)
    if rank == "k" or rank == "q" or rank == "j" or rank == "t" then
        return 10
    elseif rank == "a" then
        return 11
    elseif rank == "s" then
        return 50
    else
        return tonumber(rank)
    end
end

function convert_num_to_rank(num)
    if num == 13 then
        return "k"
    elseif num == 12 then
        return "q"
    elseif num == 11 then
        return "j"
    elseif num == 10 then
        return "t"
    elseif num == 14 then
        return "a"
    elseif num == 15 then
        return "2"
    else
        return tostring(num)
    end
end

function set_boss_blind()
    local num = ante/8
    local boss_type
    if math.floor(num) == num then
        boss_type = finisher_blinds
    else
        boss_type = boss_blind
    end
    repeat
        boss_num = math.random(#boss_type)
    until boss_type[boss_num] ~= last_boss
    last_boss = boss_type[boss_num]
end

function get_boss_info()
    local num = boss_num/8
    local boss_type
    if math.floor(num) == num then
        boss_type = finisher_blinds
    else
        boss_type = boss_blind
    end
    local col = boss_blind_description[boss_type[boss_num]][1]
    local info = boss_blind_description[boss_type[boss_num]][2]
    local boss_info_table = text_width(info,(SCREEN_WIDTH-(hud_width+10))/6)--6 is a good estimate for the average with of a character on the screen
    return col, boss_info_table
end

function text_width(info,width)--fit text to screen
    local boss_part = ""
    local boss_info_table = {}
    if string.len(info) > width then
        for i in string.gmatch(info,"%S+") do
            if string.len(boss_part) + string.len(i) < width then
                boss_part = boss_part..i.." "
            else
                table.insert(boss_info_table,boss_part)
                boss_part = i.." "
            end
        end
        table.insert(boss_info_table,boss_part)
    else
        table.insert(boss_info_table,info)
    end
    return boss_info_table
end

function add_to_dealt()
    local cards_added = 0
    local goal
    if blind == 3 and boss_active == true then
        if boss_blind[boss_num] == "The Serpent" then
            goal = 3
        else
            goal = hand_size - #dealt
        end
    else
        goal = hand_size - #dealt
    end
    while cards_added < goal and #deck >0 do
        local randomvalue = math.random(#deck)
        table.insert(dealt, deck[randomvalue])
        table.insert(dealt_enhancement, deck_enhancement[randomvalue])
        table.insert(used_cards, deck[randomvalue])
        table.remove(deck, randomvalue)
        table.remove(deck_enhancement, randomvalue)
        cards_added = cards_added + 1
    end
end

function do_boss_debuff(played,held_in_hand_enhanced)
    local num = ante/8
    if math.floor(num) ~= num then
        if boss_blind[boss_num] == "The Club" then
            for i,v in ipairs(played) do
                if string.sub(v,2,2) == "c" then
                    table.remove(played,i)
                    table.remove(hand_enhancement,i)
                end
            end
        elseif boss_blind[boss_num] == "The Goad" then
            for i,v in ipairs(played) do
                if string.sub(v,2,2) == "s" then
                    table.remove(played,i)
                    table.remove(hand_enhancement,i)
                end
            end
        elseif boss_blind[boss_num] == "The Window" then
            for i,v in ipairs(played) do
                if string.sub(v,2,2) == "d" then
                    table.remove(played,i)
                    table.remove(hand_enhancement,i)
                end
            end
        elseif boss_blind[boss_num] == "The Head" then
            for i,v in ipairs(played) do
                if string.sub(v,2,2) == "h" then
                    table.remove(played,i)
                    table.remove(hand_enhancement,i)
                end
            end
        elseif boss_blind[boss_num] == "The Plant" then
            for i,v in ipairs(played) do
                if string.sub(v,1,1) == "k" or string.sub(v,1,1) == "q" or string.sub(v,1,1) == "j" then
                    table.remove(played,i)
                    table.remove(hand_enhancement,i)
                end
            end
        elseif boss_blind[boss_num] == "The Hook" then--some boss_blind stuff
            for i=1, 2 do
                table.remove(dealt, math.random(#dealt))--discard 2 cards
            end
        elseif boss_blind[boss_num] == "The Tooth" then
            cash = cash - 1
        elseif boss_blind[boss_num] == "The Flint" then
            chips = chips/2
            multiplier = multiplier/2
        elseif boss_blind[boss_num] == "The Ox" then
            local maximum = hand_multipliers[hand_type][3]
            local max_hand = true
            for k,v in pairs(hand_multipliers) do
                if v[3] >= maximum and k ~= hand_type then
                    max_hand = false
                end
            end
            if max_hand then
                cash = 0
            end
        elseif boss_blind[boss_num] == "The Arm" then
            for i,v in ipairs(planets_info) do
                if v[3] == hand_type and hand_multipliers[hand_type][1] > min_hand_multipliers[hand_type][1] then
                    hand_multipliers[hand_type][1] = hand_multipliers[hand_type][1] - v[1]
                    hand_multipliers[hand_type][2] = hand_multipliers[hand_type][2] - v[2]
                    break
                end
            end
            chips = hand_multipliers[hand_type][1]
            multiplier = hand_multipliers[hand_type][2]
        end
    else
        if finisher_blinds[boss_num] == "Verdent Leaf" then--only played debuff atm
            if joker_sale == false then
                played = {}
                held_in_hand_enhanced = {}
            end
        end
    end
    return played,held_in_hand_enhanced
end

function calculate_total_score(hand)
    local played = hand
    local held_in_hand_enhanced = dealt_enhancement
    for j,k in ipairs(jokers) do
        on_play_jokers(k,j)
        if k == "Hiker" then
            for i,v in ipairs(played) do
                hand_enhancement[i][1] = hand_enhancement[i][1] + 5
            end
        end
    end
    for i,v in ipairs(played) do--works feels like it shouldnt 
        for j=1, #ignore do
            if v == ignore[j] then
                table.remove(played,i)
                table.remove(hand_enhancement,i)
            end
        end
    end
    if blind == 3 and boss_active == true then
        played,held_in_hand_enhanced = do_boss_debuff(played,held_in_hand_enhanced)
    end
    for i, v in ipairs(played) do--chips from cards and conditional jokers
        Debug.print(v)
        Debug.print(hand_enhancement[i][1])
        chips = chips + hand_enhancement[i][1]--chips from card
        played_enhancement(hand_enhancement[i])
        for j,k in ipairs(jokers) do 
            per_card_joker(k,j,v,i)--chips and mult from jokers
        end
    end
    for i,v in ipairs(jokers) do
        final_jokers(v,i)
    end
    for i,v in ipairs(held_in_hand_enhanced) do
        for j,k in ipairs(jokers) do
            held_jokers(k,j)
        end
        held_enhancement(v)
    end
    if observatory then
        for i,v in ipairs(consumable) do
            if planets_info[v] ~= nil then
                if planets_info[v][3] == hand_type then
                    multiplier = multiplier*1.5
                end
            end
        end
    end
    if deck_name == "Plasma" then
        local total = chips +multiplier
        chips = total/2
        multiplier = total/2
    end
    return chips*multiplier
end

function number_to_payout(num)
    local payout = ""
    for i=1, tonumber(num) do
        payout = payout .. "$"
    end
    return payout
end

function lose()
    win = false
    gameplay_phase = 5
end

function add_stickers(sticker,addition)
    local rand = math.random()
    if sticker == "Eternal" then-- to not do for food jokers
        if rand< 0.3 then
            table.insert(addition,"Eternal")
        end
    elseif sticker == "Perishable" then
        for i,v in ipairs(addition) do
            if v == "Eternal" then
                goto continue
            end
        end
        if rand< 0.3 then
            table.insert(addition,"Perishable")
        end
    elseif sticker == "Rental" then
        if rand< 0.3 then
            table.insert(addition,"Rental")
            addition[1] = 1
        end
    end
    ::continue::
    return addition
end

function add_to_shop()
    local cards_added = 0
    local goal = shop_card_size - #shop_jokers
    while cards_added < goal do
        local shop_count = 0
        local index = math.random()
        repeat
            shop_count = shop_count + 1
            index = index - shop_weights[shop_count]
        until index <= 0
        if shop_count ==1 then--jokers
            local rand = math.random()
            local rarity
            if rand <0.70 then
                rarity = common_joker
            elseif rand>=0.95 then
                rarity = rare_joker
            else
                rarity = uncommon_joker
            end
            local randomvalue = math.random(#rarity)
            table.insert(shop_jokers, rarity[randomvalue])
            local cost = math.floor(joker_info[rarity[randomvalue]][1]*discount_percent)
            local addition = {cost}
            local rand_enhance = math.random()
            for i,v in ipairs(shop_jokers_enhancement_weight) do
                if rand_enhance < v then
                    if i >1 then
                        table.insert(addition,editions[i-1])
                        break
                    else
                        table.insert(addition,"Negative")
                        break
                    end
                end
            end
            for i,v in ipairs(stickers) do
                addition = add_stickers(v,addition)
            end
            table.insert(shop_jokers_enhancement,addition)
        elseif shop_count == 2 then--tarots
            local randomvalue = math.random(#tarots_deck)
            local cost = math.floor(shop_costs[2]*discount_percent)
            table.insert(shop_jokers, tarots_deck[randomvalue])
            table.insert(shop_jokers_enhancement,{cost})
        elseif shop_count == 3 then--planets
            local randomvalue = math.random(2,#planets_deck)
            local cost = math.floor(shop_costs[3]*discount_percent)
            table.insert(shop_jokers, planets_deck[randomvalue])
            table.insert(shop_jokers_enhancement,{cost})
        elseif shop_count>3 and shop_weights[shop_count]>2 then--playing cards
            local randomvalue = math.random(#standard_deck)
            local cost = shop_costs[1]--always cost 1
            table.insert(shop_jokers, standard_deck[randomvalue])
            local num = convert_rank_to_num(string.sub(standard_deck[randomvalue],1,1))
            local addition = {cost,num}
            if shop_enhanced then
                local rand = math.random()
                for i,v in ipairs(shop_cards_enhancement_weight) do
                    if rand<v then
                        if i ==1 then
                            local j = math.random(#card_enhancement)
                            table.insert(addition,card_enhancement[j])
                            break
                        elseif i == 2 then
                            local rand2 = math.random()
                            for j,k in ipairs(cards_edition_prob) do
                                if rand2 < k then
                                    table.insert(addition,editions[j])
                                    break
                                end
                            end
                        elseif i == 3 then
                            local j = math.random(#seals)
                            table.insert(addition,seals[j])
                            break
                        end
                    end
                end
            end
            table.insert(shop_jokers_enhancement,addition)
        elseif shop_count>3 and shop_weights[shop_count]==2 then--spectral
            local randomvalue = math.random(#spectral_deck)
            local cost = math.floor(shop_costs[4]*discount_percent)
            table.insert(shop_jokers, spectral_deck[randomvalue])
            table.insert(shop_jokers_enhancement,{cost})
        end
        cards_added = cards_added + 1
    end
end

function math.Clamp(val, lower, upper)--cash out
    assert(val and lower and upper, "not very useful error message here")
    if lower > upper then lower, upper = upper, lower end -- swap if boundaries supplied the wrong way
    return math.max(lower, math.min(upper, val))
end

function draw_title_screen()
    screen.blit(SCREEN_DOWN, 0, 0, menubg)--bottom screen background
    screen.blit(SCREEN_UP, 0, 0, menubg)
    screen.blit(SCREEN_UP, 39, 44 - (logo_bop / 30), logo)--logo
    screen.setAlpha(50)
    screen.drawFillRect(SCREEN_DOWN, 0, 78, SCREEN_WIDTH, SCREEN_HEIGHT, Color.new(0, 0, 0))--press a to start background 1
    screen.drawFillRect(SCREEN_UP, 0, 192, 256, 178, Color.new(0, 0, 0))--"GAME BY LOCAL THUNK, RECREATED FOR THE DS" background
    screen.setAlpha(100)
    screen.drawFillRect(SCREEN_DOWN, 0, 50, SCREEN_WIDTH, SCREEN_HEIGHT, Color.new256(111, 111, 111))--press a to start background 2
    screen.print(SCREEN_DOWN, SCREEN_WIDTH/2-20, SCREEN_HEIGHT-10, "A: Play")
    screen.print(SCREEN_DOWN, 0, 5, "Y: Cycle Seeded")
    screen.print(SCREEN_DOWN, 0, 15, "Up/Down: Select Seed")
    screen.print(SCREEN_DOWN, 115, 5, "Left/Right: Select Deck")
    screen.print(SCREEN_DOWN, 150, 15, "X/B: Select Stake")
    screen.print(SCREEN_DOWN, 0, 65, deck_able[selected_deck].." Deck")
    local deck_text = text_width(deck_details[deck_able[selected_deck]],(SCREEN_WIDTH-(hud_width+10))/6)
    for i,v in ipairs(deck_text) do 
        screen.print(SCREEN_DOWN, hud_width+10, 65+10*(i-1), v)
    end
    screen.print(SCREEN_DOWN, 0, 120, stakes[selected_stake].." Stake")
    local stake_text = text_width(stakes_info[stakes[selected_stake]],(SCREEN_WIDTH-(hud_width+10))/6)
    for i,v in ipairs(stake_text) do 
        screen.print(SCREEN_DOWN, hud_width+10, 120+10*(i-1), v)
    end
    screen.print(SCREEN_DOWN, 0, 150, "Seeded run: " .. tostring(seeded_run))
    screen.print(SCREEN_DOWN, 160, 150, seeded_num)
    screen.print(SCREEN_UP, 2, 185, "GAME BY LOCAL THUNK, RECREATED FOR THE DS")
    logo_bop = logo_bop + 1
    if logo_bop > 119 then
        logo_bop = -120
    end
end

function draw_blind_menu()
    local offset = 4
    local x = 1 --the left position of the small blind
    local x_width = 84
    local x_max = SCREEN_WIDTH
    local y_max = SCREEN_HEIGHT
    local y = y_max/3
    Image.setTint(blind_ui, Color.new256(241, 184, 91))--tint box behind name
    tutorial_graphics = Sprite.new(tutorial_sheet, 96, 16, VRAM)
    for i =1, 2 do
        screen.setAlpha(70)
        screen.drawFillRect(SCREEN_DOWN, i*(x + x_width)-x_width, y, i*(x + x_width), y_max, normal_blind[i][2])--small blind colour big box
        screen.setAlpha(100)
        screen.blit(SCREEN_DOWN, i*(x+x_width) + 4 - x_width, y + 3, blind_ui)--"box behind name"
        screen.print(SCREEN_DOWN, i*(x+x_width) + 6 - x_width, y + 8, normal_blind[i][1], normal_blind[i][2])--Text "small blind"
        screen.blit(SCREEN_DOWN, i*(x+x_width) + 4 - x_width, y + 21 + offset, blind_ui_box)--grey box
        tutorial_graphics:drawFrame(SCREEN_DOWN, i*(x+x_width) + 5 - x_width, y + 23 + offset,5)--"score at least:" 
        screen.print(SCREEN_DOWN, i*(x+x_width) + 6 - x_width, y + 40, minimumscore[i], Color.new256(255, 255, 255))--score needed
        screen.print(SCREEN_DOWN, i*(x+x_width) + 6 - x_width, y_max - 50, "Skip Reward:", Color.new256(255, 255, 255))--need to add these rewards i.e negative tags
        screen.print(SCREEN_DOWN, i*(x+x_width) + 6 - x_width, y_max - 35, blind_tags[i], Color.new256(255, 255, 255))--issue
    end
    if blind < 3 then
        screen.print(SCREEN_UP, hud_width + 10, 70, "Blind Tag:"..blind_tags[blind], Color.new256(255, 255, 255))
        local tag_details = text_width(tag_info[blind_tags[blind]],(SCREEN_WIDTH-(hud_width+10))/6)--issue with orbital when trying to display the hand type
        for i,v in ipairs(tag_details) do
            screen.print(SCREEN_UP, hud_width + 10, 70+10*(i), v) 
        end
    end
    screen.print(SCREEN_UP,hud_width+10,20 + 10*#boss_info,"Tags owned:")
    for i, v in ipairs(tag_select) do
        screen.print(SCREEN_UP,hud_width+10,20 + 10*#boss_info + 10*(i),v,Color.new(31,31,31))
    end
    screen.print(SCREEN_DOWN, SCREEN_WIDTH/3, 5, "A: Progress")
    screen.print(SCREEN_DOWN, SCREEN_WIDTH/3, 15, "X: Reroll Boss Blind ($10)")
    screen.print(SCREEN_DOWN, SCREEN_WIDTH/3, 25, "Y: SKip Blind")
end

function draw_boss_menu()
    local offset = 4
    local x = 1 --the left position of the small blind
    local x_width = 84
    local x_max = SCREEN_WIDTH
    local y_max = SCREEN_HEIGHT
    local y = y_max/3
    screen.setAlpha(100)
    screen.drawFillRect(SCREEN_DOWN, 3*x + 2*x_width, y, 3*(x + x_width), y_max, boss_col)--boss blind colour big box
    screen.blit(SCREEN_DOWN, x + 4 + 2*x_width, y + 3, blind_ui)--"box behind name"
    if ante%8 == 0 then
        screen.print(SCREEN_DOWN, x + 2*x_width + 6, y + 8, finisher_blinds[boss_num], Color.new(0, 0, 0))--name
    else
        screen.print(SCREEN_DOWN, x + 2*x_width + 6, y + 8, boss_blind[boss_num], Color.new(0, 0, 0))--name
    end
    screen.blit(SCREEN_DOWN, x + 2*x_width + 4, y + 21 + offset, blind_ui_box)
    tutorial_graphics:drawFrame(SCREEN_DOWN, 3*x + 2*x_width + 5, y + 23 + offset, 5)
    screen.print(SCREEN_DOWN, x + 6 + 2*x_width, y + 40, minimumscore[3], Color.new(31, 31, 31))--score needed
    screen.print(SCREEN_DOWN, 3*x + 2*x_width + 6, y_max - 50, "A Challenging", Color.new(31, 31, 31))
    screen.print(SCREEN_DOWN, 3*x + 2*x_width + 6, y_max - 40, "Encounter", Color.new(31, 31, 31))
end

function phase_2_update()
    local offset = 10
    local rhs = hud_width/2 + offset
    local lhs = offset
    screen.drawFillRect(SCREEN_UP, 0,0,hud_width,SCREEN_HEIGHT,Color.new256(49,49,51))
    screen.blit(SCREEN_UP, 0,0,hudbg)
    screen.blit(SCREEN_UP, 0,0,hud)
    screen.print(SCREEN_UP, lhs, 180, ante.."/8")
    screen.print(SCREEN_UP, rhs, 180, round)
    screen.print(SCREEN_UP, 35, 77, round_score)
    screen.print(SCREEN_UP, lhs, 98, hand_type)
    screen.print(SCREEN_UP, lhs, 115, chips)
    screen.print(SCREEN_UP, rhs, 115, multiplier)
    screen.print(SCREEN_UP, lhs, 140, hands,Color.new(0,0,31))
    screen.print(SCREEN_UP, rhs, 140, discards,Color.new(31,0,0))
    screen.print(SCREEN_UP, 15, 157, cash)
    if gameplay_phase>0 then
        screen.print(SCREEN_UP, hud_width + 10, 10, "Boss Blind ability:",Color.new(0,0,0))
        for i, v in ipairs(boss_info) do
            screen.print(SCREEN_UP, hud_width+10, 10+10*(i), v, Color.new(0,0,0))
        end
    end
    if gameplay_phase < 4 and gameplay_phase>0 then
        screen.blit(SCREEN_UP, 0, 10, blind_ui)--"box behind name"
        screen.print(SCREEN_UP, 0, 30, "Minimum Score")
        screen.print(SCREEN_UP, 0, 50, "Reward: $"..blind_payouts[blind])
        if blind < 3 then
            screen.print(SCREEN_UP, 5, 15, normal_blind[blind][1],normal_blind[blind][2])--Text "small blind" 
            screen.print(SCREEN_UP, 0, 40, minimumscore[blind])
        else
            screen.print(SCREEN_UP, 5, 15, boss_blind[boss_num],Color.new(0,0,0))
            screen.print(SCREEN_UP, 0, 40, minimumscore[blind],Color.new(31,0,5))
        end
    end
end

function draw_card_base_graphic(x, y, scale, enhancement_type)
    Image.scale(card_graphic, math.floor(card_size[1] * scale), math.floor(card_size[2] * scale))--white card base
    Image.setTint(card_graphic,Color.new256(255,255,255))
    for j,k in ipairs(enhancement_type) do
        if k == "Gold" then
            Image.setTint(card_graphic,Color.new256(255,215,0))
        elseif k== "Steel" then
            Image.setTint(card_graphic,Color.new256(192,192,192))
        elseif k == "Glass" then
            Image.setTint(card_graphic,Color.new256(175,238,238))
        elseif k == "Stone" then
            Image.setTint(card_graphic,Color.new256(0,0,0))
        end
    end
    screen.blit(SCREEN_DOWN, x, y, card_graphic)
end

function draw_card_detail(x, y, scale, rank, suit)
    if rank ~= "s" then
        local rank_num = rank_graphics[rank]
        local suit_display = suit_graphics[suit]
        Image.scale(rank_num, math.floor(card_size[1] * scale), math.floor(card_size[2] * scale)) 
        Image.scale(suit_display, math.floor(card_size[1] * scale), math.floor(card_size[2] * scale))
        screen.blit(SCREEN_DOWN, x, y, rank_num)
        screen.blit(SCREEN_DOWN, x, y, suit_display)
    end
end

function draw_card_deck_graphic(deck, raise_selected, usage)
    local x_space = math.floor(SCREEN_WIDTH/(#deck+1))-- need #dealt+1 due to number of gaps
    local y_pos
    local spacing = 5
    local scale = 1
    local enhancement_type
    tutorial_graphics:drawFrame(SCREEN_DOWN, 16, 12, 0)--frame number is multiple of 96
    tutorial_graphics:drawFrame(SCREEN_DOWN, 149, 4, 1)
    tutorial_graphics:drawFrame(SCREEN_DOWN, 16, 4, 2)
    tutorial_graphics:drawFrame(SCREEN_DOWN, 144, 12, 3)
    for i,v in ipairs(deck) do
        if usage == "dealt" then
            if raise_selected == i and gameplay_phase ~= 3 and kind == 1 then
                y_pos =  SCREEN_HEIGHT - 2*card_size[2] - 4*spacing--raising up to see better
                scale = 1.25
            else
                y_pos = SCREEN_HEIGHT - card_size[2] - spacing
            end
            enhancement_type = dealt_enhancement
        elseif usage == "hand" then
            y_pos = SCREEN_HEIGHT/2 - card_size[2]/2
            enhancement_type = hand_enhancement
        end
        local rank = string.sub(v,1,1)
        local suit = string.sub(v,2,2)
        local x = x_space*i
        draw_card_base_graphic(x-card_size[1]/2,y_pos,scale,enhancement_type[i])
        draw_card_detail(x-card_size[1]/2,y_pos,scale,rank,suit)
        scale = 1
    end
end

function draw_joker_card_graphic()
    local x = (SCREEN_WIDTH-hud_width)/(#jokers+1)
    local y_place = SCREEN_HEIGHT-card_size[2]-2
    if blind == 3 and ante%8 == 0 and finisher_blinds[boss_num] == "Amber Acorn" then--need to look at the descriptors
        if gameplay_phase == 2 or gameplay_phase==3 then
            for i,v in ipairs(jokers) do
                screen.drawFillRect(SCREEN_UP, hud_width + x + (i-1)*card_size[1],y_place,hud_width + x + (i)*card_size[1],y_place+card_size[2],colours[3])
            end
        end
    else
        local joke_index = 0
        for i,v in ipairs(jokers) do
            joke_index = joker_info[v][3]
            if joke_index ~= 99 then
                screen.blit(SCREEN_UP, hud_width + x + (i-1)*card_size[1], y_place, joker_graphics, card_size[1]*(joke_index-1),0, card_size[1], card_size[2])
            else
                screen.drawFillRect(SCREEN_UP, hud_width + x + (i-1)*card_size[1],y_place,hud_width + x + (i)*card_size[1],y_place+card_size[2],colours[3])
            end
        end
    end
end

function draw_shop_jokers()
    local x = SCREEN_WIDTH/(3)--chosen for looks but if decide to add many jokers to shop do full width
    local y_place = SCREEN_HEIGHT/2
    local joke_index = 0
    for i,v in ipairs(shop_jokers) do
        if joker_info[v] ~= nil then
            joke_index = joker_info[v][3]
            if joke_index ~= 99 then
                screen.blit(SCREEN_DOWN, x + (i-1)*card_size[1], y_place, joker_graphics, card_size[1]*(joke_index-1),0, card_size[1], card_size[2])
            else
                screen.drawFillRect(SCREEN_DOWN,x + (i-1)*card_size[1], y_place,x + (i)*card_size[1], y_place+card_size[2],colours[3])
            end
        elseif string.len(v) == 2 then
            draw_card_base_graphic(x + (i-1)*card_size[1], y_place,1,shop_jokers_enhancement[i])
            draw_card_detail(x + (i-1)*card_size[1], y_place,1,string.sub(v,1,1),string.sub(v,2,2))
        else
            screen.drawFillRect(SCREEN_DOWN, x + (i-1)*card_size[1], y_place, x + (i)*card_size[1], y_place+card_size[2],colours[5])
        end
    end
end

function draw_pack_graphics()
    local x = 2*SCREEN_WIDTH/(3)--chosen for looks but if decide to add many jokers to shop do full width
    local y_place = SCREEN_HEIGHT/2
    for i,v in ipairs(packs) do
        screen.blit(SCREEN_DOWN, x+card_size[1]*(i-1), y_place, img_packs, card_size[1]*(v[3]-1),0, card_size[1], card_size[2])--change to packs graphic
    end
end

function draw_tarots_graphics()--add art
    local x = (SCREEN_WIDTH-hud_width)/(#consumable+1)
    local y_place = SCREEN_HEIGHT-2*card_size[2]-10
    for i,v in ipairs(consumable) do
        screen.drawFillRect(SCREEN_UP, hud_width + x + (i-1)*card_size[1], y_place, hud_width + x + (i)*card_size[1], y_place+card_size[2],colours[5])
    end
end

function card_details(kind)
    if kind == 1 then--playing cards
        if gameplay_phase == 2 then
            if #dealt >0 then
                screen.print(SCREEN_UP,hud_width+10,50,dealt[selected_card],colours[1])
                screen.print(SCREEN_UP, hud_width+10, 50+10, "+"..dealt_enhancement[selected_card][1].." Chips", colours[1])
                for i=2,#dealt_enhancement[selected_card] do
                    local v = dealt_enhancement[selected_card][i]
                    screen.print(SCREEN_UP, hud_width+10, 50+10*i, v, colours[1])
                end
            else
                screen.print(SCREEN_UP,hud_width+10,50,"No card selected",colours[1])
            end
        elseif gameplay_phase == 4.5 then
            if #pack_cards >0 then
                local height = 50
                screen.print(SCREEN_UP,hud_width+10,height,pack_cards[selected_card],colours[1])
                screen.print(SCREEN_UP,hud_width+10,height +10,"A: add to selection",colours[1])
                screen.print(SCREEN_UP,hud_width+10,height+20,"Y: reset selection",colours[1])
                screen.setAlpha(30)
                screen.drawFillRect(SCREEN_DOWN, SCREEN_WIDTH*(selected_card)/(hand_size+1)-5,SCREEN_HEIGHT/2-5,SCREEN_WIDTH*(selected_card)/(hand_size+1)+card_size[1]+5,SCREEN_HEIGHT/2+card_size[2]+5,Color.new(0,0,0))--black shadow
                screen.setAlpha(100)
                screen.print(SCREEN_UP, hud_width+10, height+30, "+"..pack_cards_enhancements[selected_card][1].." Chips", colours[1])
                for i=2,#pack_cards_enhancements[selected_card] do
                    local v = pack_cards_enhancements[selected_card][i]
                    screen.print(SCREEN_UP, hud_width+10, height+30+10*(i-1), v, colours[1])--why does this show glass then enhancement
                end
            else
                screen.print(SCREEN_UP,hud_width+10,50,"No card selected",colours[1])
            end
        end
    elseif kind == 1.5 and gameplay_phase==4 then--main shop
        if #shop_jokers > 0 then-- currently no additional foil polychrome etc in shop
            local x_pos = SCREEN_WIDTH/(3)--chosen for looks but if decide to add many jokers to shop do full width
            local y_pos = SCREEN_HEIGHT/2
            screen.setAlpha(30)
            screen.drawFillRect(SCREEN_DOWN, x_pos+(selected_card-1)*card_size[1], y_pos, x_pos+selected_card*card_size[1],y_pos+card_size[2],Color.new(0,0,0))
            screen.setAlpha(100)
            screen.print(SCREEN_UP,hud_width+10,50,shop_jokers[selected_card]..": "..selected_card.."/"..#shop_jokers,colours[2])
            if joker_info[shop_jokers[selected_card]] ~= nil then
                local joker_info_text = text_width(joker_info[shop_jokers[selected_card]][2],(SCREEN_WIDTH-(hud_width+10))/6)
                for i,v in ipairs(joker_info_text) do
                    screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v,colours[2])
                end
                screen.print(SCREEN_UP,hud_width+10,60+10*#joker_info_text,"Buy(Y):$"..shop_jokers_enhancement[selected_card][1],colours[2])
                for i=2,#shop_jokers_enhancement[selected_card] do
                    local v = shop_jokers_enhancement[selected_card][i]
                    screen.print(SCREEN_UP,hud_width+10,60+10*#joker_info_text+10*(i-1),v,colours[2])
                end
            elseif string.len(shop_jokers[selected_card]) == 2 then
                screen.print(SCREEN_UP,hud_width+10,50,shop_jokers[selected_card],colours[2])
                screen.print(SCREEN_UP,hud_width+10,60,"Buy(Y):$".. shop_costs[1],colours[2])
            else
                local count = 0
                repeat
                    count = count +1
                    local c_deck = consumable_deck[count]
                until c_deck[shop_jokers[selected_card]] ~= nil
                local info_text
                if count == 2 then
                    info_text = text_width(consumable_deck[count][shop_jokers[selected_card]][3],(SCREEN_WIDTH-(hud_width+10))/6)
                else
                    info_text = text_width(consumable_deck[count][shop_jokers[selected_card]],(SCREEN_WIDTH-(hud_width+10))/6)
                end
                for i,v in ipairs(info_text) do
                    screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v,colours[2])
                end
                screen.print(SCREEN_UP,hud_width+10,60+10*#info_text,"Buy(Y):$"..shop_jokers_enhancement[selected_card][1],colours[2])
                for i=2,#shop_jokers_enhancement[selected_card] do
                    local v = shop_jokers_enhancement[selected_card][i]
                    screen.print(SCREEN_UP,hud_width+10,60+10*#info_text+10*(i-1),v,colours[2])
                end
            end
        else
            screen.print(SCREEN_UP,hud_width+10,60,"No Jokers Available to Buy",colours[2])
        end
    elseif kind == 2 then--jokers
        if #jokers >0 then
            local x_pos = hud_width+(SCREEN_WIDTH-hud_width)/(#jokers+1)
            local y_pos = SCREEN_HEIGHT-card_size[2]-2
            local joker_info_text = text_width(joker_info[jokers[selected_card]][2],(SCREEN_WIDTH-(hud_width+10))/6)
            if blind == 3 and ante%8 == 0 and finisher_blinds[boss_num] == "Amber Acorn" then
                if gameplay_phase == 2 or gamplay_phase == 3 then
                    screen.print(SCREEN_UP,hud_width+10,50,"Boss ability in effect",colours[3])
                end
            else
                screen.print(SCREEN_UP,hud_width+10,50,jokers[selected_card]..": "..selected_card.."/"..joker_size,colours[3])
                for i,v in ipairs(joker_info_text) do
                    screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v,colours[3])
                end
                display_joker_specifics(jokers[selected_card],selected_card,#joker_info_text)
                screen.print(SCREEN_UP,hud_width+10,60 + 10*#joker_info_text+10,"Sell(Y): $"..jokers_enhancement[selected_card][2],colours[3])
                for i=3,#jokers_enhancement[selected_card] do
                    if type(jokers_enhancement[selected_card][i]) ~= "table" then
                        screen.print(SCREEN_UP, hud_width+10, 60 + 10*#joker_info_text+10*(i-1), jokers_enhancement[selected_card][i], colours[3])
                    else
                        screen.print(SCREEN_UP, hud_width+10, 60 + 10*#joker_info_text+10*(i-1), jokers_enhancement[selected_card][i][1].." Rounds left:"..jokers_enhancement[selected_card][i][2], colours[3])
                    end
                end
            end
            screen.setAlpha(30)
            screen.drawFillRect(SCREEN_UP, x_pos+(selected_card-1)*card_size[1], y_pos, x_pos+selected_card*card_size[1],y_pos+card_size[2],Color.new(0,0,0))--may make a better way
            screen.setAlpha(100)
        else
            screen.print(SCREEN_UP,hud_width+10,50,"No joker selected",colours[3])
        end
    elseif kind == 2.5 and gameplay_phase ==4 then--packs
        if #packs > 0 then
            local x_pos = 2*SCREEN_WIDTH/(3)--chosen for looks but if decide to add many jokers to shop do full width
            local y_pos = SCREEN_HEIGHT/2
            screen.print(SCREEN_UP,hud_width+10,50,packs[selected_card][1]..": "..selected_card.."/"..#packs,colours[4])--name
            local pack_text = text_width(pack_size[packs[selected_card][2]],(SCREEN_WIDTH-(hud_width+10))/6)
            for i,v in ipairs(pack_text) do
                screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v,colours[4])
            end
            screen.print(SCREEN_UP,hud_width+10,60+10*#pack_text,"Buy(Y):$"..math.floor(shop_costs[5][packs[selected_card][2]]*discount_percent),colours[4])--cost
            screen.setAlpha(30)
            screen.drawFillRect(SCREEN_DOWN, x_pos+(selected_card-1)*card_size[1], y_pos, x_pos+selected_card*card_size[1],y_pos+card_size[2],Color.new(0,0,0))
            screen.setAlpha(100)
        else
            screen.print(SCREEN_UP,hud_width+10,60,"No packs Available to Buy",colours[4])
        end
    elseif kind == 3 then--consumables
        if #consumable > 0 then
            local count= 0
            local x = (SCREEN_WIDTH-hud_width)/(#consumable+1)
            local y_place = SCREEN_HEIGHT-2*card_size[2]-10
            screen.setAlpha(30)
            screen.drawFillRect(SCREEN_UP, hud_width + x + (selected_card-1)*card_size[1], y_place, hud_width + x + (selected_card)*card_size[1], y_place+card_size[2],Color.new(0,0,0))
            screen.setAlpha(100)
            repeat
                count = count +1
            until consumable_deck[count][consumable[selected_card]] ~= nil
            screen.print(SCREEN_UP,hud_width+10,50,consumable[selected_card]..": "..selected_card.."/"..consumable_size,colours[5])
            local info_text
            if count ==2 then
                info_text = text_width("Use(B):"..consumable_deck[count][consumable[selected_card]][3],(SCREEN_WIDTH-(hud_width+10))/6)
            else
                info_text = text_width("Use(B):"..consumable_deck[count][consumable[selected_card]],(SCREEN_WIDTH-(hud_width+10))/6)
            end
            for i,v in ipairs(info_text) do
                screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v,colours[5])
            end
            screen.print(SCREEN_UP, hud_width+10,60+10*#info_text,"Sell(Y):$"..math.floor(shop_costs[count+1]*discount_percent/2),colours[5])
            screen.print(SCREEN_UP, hud_width+10,60+10*#info_text+10,consumable_enhancement[selected_card],colours[5])
        else
            screen.print(SCREEN_UP,hud_width+10,60,"No consumable Available",colours[5])
        end
    elseif kind == 3.5 and gameplay_phase == 4 then--voucher
        if #voucher_show>0 then
            local x = (SCREEN_WIDTH/2-card_size[1]*(#voucher_show-1)/2)
            screen.setAlpha(30)
            screen.drawFillRect(SCREEN_DOWN,x+(selected_card-1)*card_size[1],SCREEN_HEIGHT/3-card_size[2],x+(selected_card)*card_size[1],SCREEN_HEIGHT/3,Color.new(0,0,0))
            screen.setAlpha(100)
            screen.print(SCREEN_UP,hud_width+10,50,voucher_show[1]..":"..selected_card.."/"..#voucher_show,Color.new(31,0,0))--name
            local voucher_info_text = text_width(vouchers_info[voucher_show[1]],(SCREEN_WIDTH-(hud_width+10))/6)
            for i,v in ipairs(voucher_info_text) do
                screen.print(SCREEN_UP,hud_width+10,50+10*i,v,Color.new(31,0,0))--details
            end
            screen.print(SCREEN_UP,hud_width+10,50 + 10*(#voucher_info_text+1),"Buy(Y): $"..shop_costs[6],Color.new(31,0,0))--cost
        else
            screen.print(SCREEN_UP,hud_width+10,60,"No Voucher Available",Color.new(31,0,0))
        end
    elseif kind == 4 and gameplay_phase == 4.5 then--pack_interior
        local buffer = 5
        local y_pack_pos = SCREEN_HEIGHT/2
        screen.print(SCREEN_UP, hud_width+10, 50, pack_interior[selected_card]..": "..selected_card.."/"..cele_size)
        if name_pack == "celestial" then
            screen.print(SCREEN_UP, hud_width+10,60, planets_info[pack_interior[selected_card]][3])
        elseif name_pack == "standard" then
            screen.print(SCREEN_UP, hud_width+10, 50+10, "+"..pack_interior_enhancement[selected_card][1].." Chips", colours[1])
            for i=2,#pack_interior_enhancement[selected_card] do--work out how to format with multiple modifiers
                local v = pack_interior_enhancement[selected_card][i]
                screen.print(SCREEN_UP, hud_width+10, 50+10*i, v, colours[1])
            end
        elseif name_pack == "bufoon" then
            local joker_info_text = text_width(joker_info[pack_interior[selected_card]][2],(SCREEN_WIDTH-(hud_width+10))/6)
            for i,v in ipairs(joker_info_text) do
                screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v)
            end
        elseif name_pack == "arcana" then
            y_pack_pos = SCREEN_HEIGHT-2*card_size[2]
            local tarot_info_text = text_width(tarots_info[pack_interior[selected_card]],(SCREEN_WIDTH-(hud_width+10))/6)
            for i,v in ipairs(tarot_info_text) do
                screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v)
            end
        elseif name_pack == "spectral" then
            y_pack_pos = SCREEN_HEIGHT-2*card_size[2]
            local spectral_info_text = text_width(spectral_info[pack_interior[selected_card]],(SCREEN_WIDTH-(hud_width+10))/6)
            for i,v in ipairs(spectral_info_text) do
                screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v)
            end
        end
        screen.setAlpha(30)
        screen.drawFillRect(SCREEN_DOWN, SCREEN_WIDTH*(selected_card)/(cele_size+1)-buffer, y_pack_pos-buffer, SCREEN_WIDTH*(selected_card)/(cele_size+1)+card_size[1]+buffer,y_pack_pos+card_size[2]+buffer,Color.new(0,0,0))--may make a better way
        screen.setAlpha(100)
    end
end

function display_joker_specifics(joker,index,text_len)--sometimes good, sometimes shit
    local display = jokers_enhancement[index][1]
    if joker == "Ride the Bus" then
        screen.print(SCREEN_UP,hud_width+10,60 + 10*text_len,"Currently "..display[1]..", to add "..display[2]+1,colours[3])
    elseif joker == "Castle" then
        screen.print(SCREEN_UP,hud_width+10,60 + 10*text_len,display[1]..", Currently "..display[2],colours[3])
    elseif joker == "Obelisk" then
        screen.print(SCREEN_UP,hud_width+10,60 + 10*text_len,"Currently "..display[1]..", to add "..display[2],colours[3])
    elseif joker == "Campfire" then 
        screen.print(SCREEN_UP,hud_width+10,60 + 10*text_len,"Currently "..display[1]..", Cards sold "..display[2],colours[3])
    elseif joker == "Yorick" then
        screen.print(SCREEN_UP,hud_width+10,60 + 10*text_len,"Currently "..display[1]..", Cards to discard "..display[2],colours[3])
    else
        screen.print(SCREEN_UP,hud_width+10,60 + 10*text_len,display,colours[3])
    end
end

function draw_cashout()
    screen.drawFillRect(SCREEN_DOWN, 31, 63, 228, 192, Color.new256(32, 32, 34))
    screen.drawFillRect(SCREEN_DOWN, 34, 64, 225, 96, Color.new256(49, 49, 51))
    screen.drawFillRect(SCREEN_DOWN, 32, 66, 227, 192, Color.new256(49, 49, 51))
    screen.drawFillRect(SCREEN_DOWN, 36, 66, 223, 96, Color.new256(39, 39, 46))
    screen.drawFillRect(SCREEN_DOWN, 36, 98, 223, 192, Color.new256(39, 39, 46))
    Image.setTint(blind_ui, Color.new256(245, 136, 42))
    screen.blit(SCREEN_DOWN, 94, 72, blind_ui)
    adv_sign = Sprite.new(shop_sheet, 76, 35, VRAM)
    adv_sign:drawFrame(SCREEN_DOWN, 94 + 4, 72 + 4, 2)
    screen.print(SCREEN_DOWN, 148, 77, "$" .. tostring(cash_out), Color.new(31, 31, 31))
    local y = 0
    for i,v in ipairs({blind_payouts[blind], hands,discards, interest}) do
        if v ~= 0 then
            local names = {"Blind Reward", "Leftover Hands {$"..hand_cash.." Each}", "Leftover Discards{$"..discard_cash.." Each}","Interest {"..max_interest.." Max}"}
            screen.print(SCREEN_DOWN, 40, 104 + y, names[i], Color.new(31, 31, 31))
            screen.print(SCREEN_DOWN, 46 + (string.len(names[i]) * 6), 104 + y, number_to_payout(v), Color.new256(241, 184, 91))
            y = y + 12
        end
    end
end

function draw_shop()
    local fit = SCREEN_WIDTH/4
    screen.print(SCREEN_DOWN, 0, 165, "Advance:")
    screen.print(SCREEN_DOWN, 0, 175, "A")
    screen.print(SCREEN_DOWN, fit, 165, "Selection:")
    screen.print(SCREEN_DOWN, fit, 175, "Up/Down")
    screen.print(SCREEN_DOWN, fit*2, 165, "Move/Use:")
    screen.print(SCREEN_DOWN, fit*2, 175, "B")
    screen.print(SCREEN_DOWN, fit*3, 165, "Reroll:")
    screen.print(SCREEN_DOWN, fit*3, 175, "X: $" .. tostring(reroll_price))
    draw_shop_jokers()
    draw_pack_graphics()
    for i,v in ipairs(voucher_show) do
        local x = (SCREEN_WIDTH/2-card_size[1]*(#voucher_show-1)/2)
        screen.drawFillRect(SCREEN_DOWN,x+(i-1)*card_size[1],SCREEN_HEIGHT/3-card_size[2],x+(i)*card_size[1],SCREEN_HEIGHT/3,Color.new(31,0,0))
    end
end

function movement() --draw red background for moving card
    if kind == 1 then
        local x_pos = math.floor(SCREEN_WIDTH/(#dealt+1))
        local y_pos = SCREEN_HEIGHT - card_size[2] - 5
        screen.setAlpha(30)
        screen.drawFillRect(SCREEN_DOWN, x_pos*first-card_size[1]/2, y_pos, x_pos*first+card_size[1]/2,y_pos+card_size[2],Color.new(31,0,0))
        screen.setAlpha(100)
    elseif kind == 2 then
        local x_pos = hud_width+(SCREEN_WIDTH-hud_width)/(#jokers+1)
        local y_pos = SCREEN_HEIGHT - card_size[2] - 2
        screen.setAlpha(30)
        screen.drawFillRect(SCREEN_UP, x_pos+(first-1)*card_size[1], y_pos, x_pos+first*card_size[1],y_pos+card_size[2],Color.new(31,0,0))
        screen.setAlpha(100)
    end
end

function move_action(kind_type,kind_type_enhancement)
    if first == 0 then
        first = selected_card
    else
        local store_card = kind_type[first]
        local store_enhancemnt = kind_type_enhancement[first]
        table.remove(kind_type,first)
        table.remove(kind_type_enhancement,first)
        table.insert(kind_type,selected_card,store_card)
        table.insert(kind_type_enhancement,selected_card,store_enhancemnt)
        first = 0
    end
end

function find_matching (index,active_cards,active_cards_enhancement)
    local potential_match = {}
    for i,v in ipairs(full_deck) do
        if v == active_cards[index] then
            table.insert(potential_match,i)
        end
    end
    for i,v in ipairs(potential_match) do
        local count = 0
        for j,k in ipairs(active_cards_enhancement[index]) do
            if k == full_deck_enhancement[v][j] then
                count = count + 1
            end
        end
        if count == #active_cards_enhancement[index] then
            return v
        end
    end
end

function use_consumable_non_target(stand_cards,stand_enhancement)--when in packs and using consumable slot it uses the pack
    local i = 0
    local store = consumable[selected_card]
    general_used = false
    repeat
        i=i+1
    until consumable_deck[i][consumable[selected_card]] ~= nil
    if i == 1 then
        consumable = use_tarots(consumable)
    elseif i == 2 then
        local plan_hand = planets_info[consumable[selected_card]]
        hand_multipliers[plan_hand[3]][1] = hand_multipliers[plan_hand[3]][1] + plan_hand[1]
        hand_multipliers[plan_hand[3]][2] = hand_multipliers[plan_hand[3]][2] + plan_hand[2]
        last_used_consumable = consumable[selected_card]
        table.remove(consumable,selected_card)
        total_planets = total_planets+1
        general_used = true
    elseif i == 3 then
        stand_cards,stand_enhancement,consumable = use_spectral(stand_cards,stand_enhancement,consumable)
    end
    if #consumable < #consumable_enhancement then
        if consumable_enhancement[selected_card] == "Negative" then
            consumable_size = consumable_size-1
        end
        table.remove(consumable_enhancement, selected_card)
        total_consumable = total_consumable+1
    elseif store == "The Fool" and last_used_consumable ~= nil then
        if consumable_enhancement[selected_card] == "Negative" then
            consumable_size = consumable_size-1
        end
        table.remove(consumable_enhancement, selected_card)
        total_consumable = total_consumable+1
    elseif store == "The High Priestess" then
        if consumable_enhancement[selected_card] == "Negative" then
            consumable_size = consumable_size-1
        end
        table.remove(consumable_enhancement, selected_card)
        total_consumable = total_consumable+1
    end
    return stand_cards,stand_enhancement
end

function use_consumable_target(active_cards,active_cards_enhancement,stand_cards,stand_enhancement)
    if consumable_deck[1][consumable[selected_card]] ~= nil then
        active_cards,active_cards_enhancement,stand_cards,stand_enhancement,consumable = use_target_tarots(active_cards,active_cards_enhancement,stand_cards,stand_enhancement,consumable)
    elseif consumable_deck[3][consumable[selected_card]] ~= nil then
        active_cards,active_cards_enhancement,stand_cards,stand_enhancement,consumable = use_target_spectral(active_cards,active_cards_enhancement,stand_cards,stand_enhancement,consumable)
    end
    if #consumable < #consumable_enhancement then
        if consumable_enhancement[selected_card] == "Negative" then
            consumable_size = consumable_size-1
        end
        table.remove(consumable_enhancement, selected_card)
        total_consumable = total_consumable+1
    end
    return active_cards,active_cards_enhancement,stand_cards,stand_enhancement
end

function use_tarots(tarots_select)
    general_used = false
    if tarots_select[selected_card] == "The Fool" and last_used_consumable ~= nil then
        table.insert(consumable, last_used_consumable)
        table.insert(consumable_enhancement, "")
        general_used = true
    elseif tarots_select[selected_card] == "The High Priestess" then
        local i = 1
        while #consumable < consumable_size+1 and i < 3 do
            local planet = planets_deck[math.random(2,#planets_deck)]
            table.insert(consumable,planet)
            table.insert(consumable_enhancement, " ")
            i = i+1
        end
        general_used = true
    elseif tarots_select[selected_card] == "The Emperor" then
        local i = 1
        while #consumable<consumable_size+1 and i < 3 do--needs to be +1 as removed later
            table.insert(consumable,tarots_deck[math.random(#tarots_deck)])
            table.insert(consumable_enhancement," ")
            i = i+1
        end
        general_used = true
    elseif tarots_select[selected_card] == "The Hermit" then
        if cash > 20 then
            cash = cash + 20
        else
            cash = 2*cash
        end
        general_used = true
    elseif tarots_select[selected_card] == "Temperence" then
        local tot = 0
        for i,v in ipairs(jokers_enhancement) do
            tot = tot + v[2]
        end
        if tot > 50 then
            tot = 50
        end
        cash = cash + tot
        general_used = true
    elseif tarots_select[selected_card] == "Judgement" and #jokers<joker_size then
        local rand = math.random()
        local rarity
        if rand <0.70 then
            rarity = common_joker
        elseif rand>=0.95 then
            rarity = rare_joker
        else
            rarity = uncommon_joker
        end
        local randomvalue = math.random(#rarity)
        add_jokers_to_selection(rarity[randomvalue],{})
        general_used = true
    elseif tarots_select[selected_card] == "The Wheel of Fortune" then
        local possible_jokers = {}
        for i,v in ipairs(jokers_enhancement) do
            local count = 0
            for j=3,#v do
                if enhancement_info[v[j]][2] ~= "Edition" then
                    count = count +1
                end
            end
            if count == #v-2 then
                table.insert(possible_jokers,i)
            end
        end
        if #possible_jokers>0 then
            local rand = math.random()
            local joker_index = math.random(#possible_jokers)
            if rand < 0.125 then
                table.insert(jokers_enhancement[possible_jokers[joker_index]],"Foil")
            elseif rand>=0.125 and rand<0.2 then
                table.insert(jokers_enhancement[possible_jokers[joker_index]],"Holographic")
            elseif rand>=0.2 and rand<0.25 then
                table.insert(jokers_enhancement[possible_jokers[joker_index]],"Polychrome")
            end
            general_used = true
        end
    end
    if general_used == true then
        last_used_consumable = tarots_select[selected_card]
        table.remove(tarots_select,selected_card)
    end
    return tarots_select
end

function use_target_tarots(active_cards,active_cards_enhancement,stand_cards,stand_enhancement,tarots_select)
    if tarots_select[selected_card] == "Death" then--repeated stuff
        if #active_cards == 2 then
            local index = find_matching(1,active_cards,active_cards_enhancement)
            full_deck[index] = active_cards[2]
            active_cards[1] = active_cards[2]
            for a,b in ipairs(active_cards_enhancement[2]) do
                full_deck_enhancement[index][a] = b
                active_cards_enhancement[1][a] = b
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Hanged Man" then
        if #active_cards <= 2 then
            local removal = {}
            for a,b in ipairs(active_cards) do
                local index = find_matching(1,active_cards,active_cards_enhancement)
                table.insert(removal,index)
                for i,v in ipairs(jokers) do
                    card_destroyed(v,i,full_deck[index],full_deck_enhancement[index])
                end
            end
            for i,v in ipairs(removal) do
                table.remove(full_deck,v-(i-1))
                table.remove(full_deck_enhancement,v-(i-1))
            end
            active_cards = {}
            active_cards_enhancement = {}
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "Strength" then
        if #active_cards <= 2 then
            for a,b in ipairs(active_cards) do
                if b ~= "st" then
                    local index = find_matching(a,active_cards,active_cards_enhancement)
                    local suit  = string.sub(b,2,2)
                    local store = full_deck_enhancement[index][1]-convert_rank_to_num(string.sub(b,1,1))
                    local rank = convert_num_to_rank(position(string.sub(b,1,1))+1)
                    full_deck[index] = rank..suit
                    full_deck_enhancement[index][1] = store+convert_rank_to_num(rank)
                    active_cards[a] = rank..suit
                    active_cards_enhancement[a][1] = store+convert_rank_to_num(rank)
                end
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Star" then
        if #active_cards <= 3 then
            for a,b in ipairs(active_cards) do
                local index = find_matching(a,active_cards,active_cards_enhancement)
                full_deck[index] = string.sub(full_deck[index],1,1).."d"
                active_cards[a] = string.sub(b,1,1).."d"
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Sun" then
        if #active_cards <= 3 then
            for a,b in ipairs(active_cards) do
                local index = find_matching(a,active_cards,active_cards_enhancement)
                full_deck[index] = string.sub(full_deck[index],1,1).."d"
                active_cards[a] = string.sub(b,1,1).."h"
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The World" then
        if #active_cards <= 3 then
            for a,b in ipairs(active_cards) do
                local index = find_matching(a,active_cards,active_cards_enhancement)
                full_deck[index] = string.sub(full_deck[index],1,1).."s"
                active_cards[a] = string.sub(b,1,1).."s"
                local potential_match = {}
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Moon" then
        if #active_cards <= 3 then
            for a,b in ipairs(active_cards) do
                local index = find_matching(a,active_cards,active_cards_enhancement)
                full_deck[index] = string.sub(full_deck[index],1,1).."c"
                active_cards[a] = string.sub(b,1,1).."c"
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Magician" then
        if #active_cards<3 then
            for a,b in ipairs(active_cards) do
                local index = find_matching(a,active_cards,active_cards_enhancement)
                for i=2,#active_cards_enhancement[a] do
                    local v = active_cards_enhancement[a][i]
                    if enhancement_info[v][2] == "Enhancement" then--issues
                        if v =="Stone" then
                            active_cards[1] = standard_deck[math.random(#standard_deck)]
                        end
                        table.remove(active_cards_enhancement[a],i)
                        table.remove(full_deck_enhancement[index],i)
                    end
                end
                table.insert(full_deck_enhancement[index],"Lucky")
                --table.insert(active_cards_enhancement[a],"Lucky")
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Empress" then
        if #active_cards<3 then
            for a,b in ipairs(active_cards) do
                local index = find_matching(a,active_cards,active_cards_enhancement)
                for i=2,#active_cards_enhancement[a] do
                    local v = active_cards_enhancement[a][i]
                    if enhancement_info[v][2] == "Enhancement" then
                        if v =="Stone" then
                            active_cards[1] = standard_deck[math.random(#standard_deck)]
                        end
                        table.remove(active_cards_enhancement[a],i)
                        table.remove(full_deck_enhancement[index],i)
                    end
                end
                table.insert(full_deck_enhancement[index],"Mult")
                --table.insert(active_cards_enhancement[a],"Mult")
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Heirophant" then
        if #active_cards<3 then
            for a,b in ipairs(active_cards) do
                local index = find_matching(a,active_cards,active_cards_enhancement)
                for i=2,#active_cards_enhancement[a] do
                    local v = active_cards_enhancement[a][i]
                    if enhancement_info[v][2] == "Enhancement" then
                        if v =="Stone" then
                            active_cards[1] = standard_deck[math.random(#standard_deck)]
                        end
                        table.remove(active_cards_enhancement[a],i)
                        table.remove(full_deck_enhancement[index],i)
                    end
                end
                table.insert(full_deck_enhancement[index],"Bonus")
                --table.insert(active_cards_enhancement[a],"Bonus")
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Chariot" then
        if #active_cards==1 then--doing 2x
            local index = find_matching(1,active_cards,active_cards_enhancement)
            for i=2,#active_cards_enhancement[1] do
                local v = active_cards_enhancement[1][i]
                if enhancement_info[v][2] == "Enhancement" then
                    if v =="Stone" then
                        active_cards[1] = standard_deck[math.random(#standard_deck)]
                    end
                    table.remove(active_cards_enhancement[1],i)
                    table.remove(full_deck_enhancement[index],i)
                    break
                end
            end
            table.insert(full_deck_enhancement[index],"Steel")
            --table.insert(active_cards_enhancement[1],"Steel")
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "Justice" then
        if #active_cards==1 then
            local index = find_matching(1,active_cards,active_cards_enhancement)
            for i=2,#active_cards_enhancement[1] do
                local v = active_cards_enhancement[1][i]
                if enhancement_info[v][2] == "Enhancement" then
                    if v =="Stone" then
                        active_cards[1] = standard_deck[math.random(#standard_deck)]
                    end
                    table.remove(active_cards_enhancement[1],i)
                    table.remove(full_deck_enhancement[index],i)
                    break
                end
            end
            table.insert(full_deck_enhancement[index],"Glass")
            --table.insert(active_cards_enhancement[1],"Glass")
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Devil" then
        if #active_cards==1 then
            local index = find_matching(1,active_cards,active_cards_enhancement)
            for i=2,#active_cards_enhancement[1] do
                local v = active_cards_enhancement[1][i]
                if enhancement_info[v][2] == "Enhancement" then
                    if v =="Stone" then
                        active_cards[1] = standard_deck[math.random(#standard_deck)]
                    end
                    table.remove(active_cards_enhancement[1],i)
                    table.remove(full_deck_enhancement[index],i)
                    break
                end
            end
            table.insert(full_deck_enhancement[index],"Gold")
            --table.insert(active_cards_enhancement[1],"Gold")
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Tower" then
        if #active_cards==1 then
            local index = find_matching(1,active_cards,active_cards_enhancement)
            for i=2,#active_cards_enhancement[1] do
                local v = active_cards_enhancement[1][i]
                if enhancement_info[v][2] == "Enhancement" then
                    table.remove(active_cards_enhancement[1],i)
                    table.remove(full_deck_enhancement[index],i)
                    break
                end
            end
            table.insert(full_deck_enhancement[index],"Stone")--adding to active_cards? shouldnt but is
            --table.insert(active_cards_enhancement[1],"Stone")
            active_cards[1] = "st"
            full_deck[index] = "st"
            active_cards_enhancement[1][1] = convert_rank_to_num("s")
            full_deck_enhancement[index][1] = convert_rank_to_num("s")
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    end
    for counter,v in ipairs(active_cards) do
        table.insert(stand_cards,#stand_cards+1, v)
        table.insert(stand_enhancement,#stand_enhancement+1, active_cards_enhancement[counter])
    end
    stand_cards, stand_enhancement = sort_deck(stand_cards, stand_enhancement)
    active_cards = {}--not working
    active_cards_enhancement = {}
    return active_cards,active_cards_enhancement,stand_cards, stand_enhancement,tarots_select
end

function use_vouchers(select)
    if select == "Overstock" then
        shop_card_size = shop_card_size + 1
        add_to_shop()
        table.insert(vouchers,"Overstock Plus")
    elseif select == "Clearence Sale" then
        discount_percent = 0.75
        for i,v in ipairs(jokers) do
            jokers_enhancement[i][2] = jokers_enhancement[i][2]- joker_info[v][1] + math.floor(joker_info[v][1]*discount_percent)--done for egg and gift card
        end
        for i,v in ipairs(shop_jokers) do
            if string.len(v) ~= 2 then
                shop_jokers_enhancement[i][1] = math.floor(shop_jokers_enhancement[i][1]*discount_percent)
            end
        end
        table.insert(vouchers,"Liquidation")
    elseif select == "Reroll Surplus" then
        min_reroll = min_reroll - 2
        reroll_price = reroll_price - 2
        table.insert(vouchers,"Reroll Glut")
    elseif select == "Crystal Ball" then
        consumable_size = consumable_size + 1
    elseif select == "Grabber" then
        max_hands = max_hands + 1
        table.insert(vouchers,"Nacho Tong")
    elseif select == "Wasteful" then
        max_discards = max_discards +1
        table.insert(vouchers,"Recyclomancy")
    elseif select == "Seed Money" then
        max_interest = 10
        table.insert(vouchers,"Money Tree")
    elseif select == "Heiroglyph" then
        ante = ante - 1
        max_hands = max_hands-1
        calculate_minimum_score()
        table.insert(vouchers,"Petroglyph")
    elseif select == "Director's Cut" then
        boss_reroll = true
        total_boss_reroll = 1
        table.insert(vouchers,"Retcon")
    elseif select == "Paint Brush" then
        max_hand_size = max_hand_size +1
        table.insert(vouchers,"Palette")
    elseif select == "Tarot Merchant" then
        shop_weights[2] = 2*shop_weights[2]
        reset_shop_weights()
        table.insert(vouchers,"Tarot Tycoon")
    elseif select == "Planet Merchant" then
        shop_weights[3] = 2*shop_weights[3]
        reset_shop_weights()
        table.insert(vouchers,"Planet Tycoon")
    elseif select == "Telescope" then
        telescope = true
        table.insert(vouchers,"Observatory")
    elseif select == "Magic Trick" then
        table.insert(shop_weights,shop_locked_weights[1])
        reset_shop_weights()
        table.insert(vouchers,"Illusion")
    elseif select == "Hone" then
        local count = shop_jokers_enhancement_weight[1]
        for i=2,#shop_jokers_enhancement_weight do
            local indv = shop_jokers_enhancement_weight[i]-count
            shop_jokers_enhancement_weight[i] = 2*indv +count
            count = count + indv
        end
        shop_cards_enhancement_weight[2] = 2*shop_cards_enhancement_weight[2]
        table.insert(vouchers,"Glow Up")
    elseif select == "Blank" then
        table.insert(vouchers,"Antimatter")
    elseif select == "Antimatter" then
        joker_size = joker_size+1
    elseif select == "Petroglyph" then
        ante = ante - 1
        max_discards = max_discards -1
        calculate_minimum_score()
    elseif select == "Overstock Plus" then
        shop_card_size = shop_card_size + 1
        add_to_shop()
    elseif select == "Liquidation" then
        discount_percent = 0.5
        for i,v in ipairs(jokers) do
            jokers_enhancement[i][2] = jokers_enhancement[i][2]- math.floor(joker_info[v][1]*0.75) + math.floor(joker_info[v][1]*discount_percent)--done for egg and gift card
        end
        for i,v in ipairs(shop_jokers) do
            if string.len(v) ~= 2 then
                local total = math.ceil(shop_jokers_enhancement[i][1]*4/3)
                shop_jokers_enhancement[i][1] = math.floor(total*discount_percent)
            end
        end
    elseif select == "Reroll Glut" then--may be an issue with The Clown
        min_reroll = min_reroll - 2
        reroll_price = reroll_price - 2
    elseif select == "Observatory" then
        observatory = true
    elseif select == "Nacho Tong" then
        max_hands = max_hands + 1
    elseif select == "Recyclomancy" then
        max_discards = max_discards +1
    elseif select == "Tarot Tycoon" then
        shop_weights[2] = 2*shop_weights[2]
        reset_shop_weights()
    elseif select == "Planet Tycoon" then
        shop_weights[3] = 2*shop_weights[3]
        reset_shop_weights()
    elseif select == "Money Tree" then
        max_interest = 20
    elseif select == "Palette" then
        max_hand_size = max_hand_size + 1
    elseif select == "Retcon" then
        total_boss_reroll = -1
    elseif select == "Glow Up" then
        local count = shop_jokers_enhancement_weight[1]
        for i=2,#shop_jokers_enhancement_weight do
            local indv = shop_jokers_enhancement_weight[i]-count
            shop_jokers_enhancement_weight[i] = 2*indv +count
            count = count + indv
        end
        shop_cards_enhancement_weight[2] = 2*shop_cards_enhancement_weight[2]
    elseif select == "Illusion" then
        shop_enhanced = true
    end
    for i,v in ipairs(vouchers) do
        if v == select then
        table.remove(vouchers,i)
        end
    end
end

function use_spectral(stand_cards, stand_cards_enhancement, spectral_select)
    general_used = false
    if spectral_select[selected_card] == "The Soul" then
        if #jokers < joker_size then
            table.insert(jokers, legendary_joker[math.random(#legendary_joker)])
            general_used = true
        end
    elseif spectral_select[selected_card] == "Black Hole" then
        for i = 2, #planets_deck do
            local plan_hand = planets_info[planets_deck[i]][3]
            hand_multipliers[plan_hand][1] = hand_multipliers[plan_hand][1] + planets_info[planets_deck[i]][1]
            hand_multipliers[plan_hand][2] = hand_multipliers[plan_hand][2] + planets_info[planets_deck[i]][2]
        end
        general_used = true
    elseif spectral_select[selected_card] == "Sigil" then
        if #stand_cards >0 then
            local suits_rand = {"h","d","s","c"}
            local index = math.random(#suits_rand)
            local copy = {}
            local count = 0
            for i, v in ipairs(stand_cards) do
                table.insert(copy,v)
            end
            repeat 
                count = count +1 
                for i,v in ipairs(copy) do
                    if full_deck[count] == v then
                        full_deck[i] = string.sub(v,1,1)..suits_rand[index]
                        table.remove(copy,i)
                    end
                end
            until #copy == 0
            for i,v in ipairs(stand_cards) do
                stand_cards[i] = string.sub(v,1,1)..suits_rand[index]
            end
            general_used = true
        end
    elseif spectral_select[selected_card] == "Ouija" then
        if #stand_cards > 0 then
            local index = math.random(13)
            local copy = {}
            local count = 0
            for i, v in ipairs(stand_cards) do
                table.insert(copy,v)
            end
            repeat 
                count = count +1 
                for i,v in ipairs(copy) do
                    if full_deck[count] == v then
                        full_deck[i] = string.sub(standard_deck[index],1,1)..string.sub(v,2,2)
                        table.remove(copy,i)
                    end
                end
            until #copy == 0
            for i,v in ipairs(stand_cards) do
                stand_cards[i] = string.sub(standard_deck[index],1,1)..string.sub(v,2,2)
            end
            max_hand_size = max_hand_size-1
            general_used = true
        end
    elseif spectral_select[selected_card] == "Immolate" then
        if #stand_cards > 0 then
            local total 
            if #stand_cards>=5 then
                total = 5
            else 
                total = #stand_cards
            end
            for i=1,total do
                local stand_index = math.random(#stand_cards)
                local index = find_matching(stand_index,stand_cards,stand_cards_enhancement)
                for i,v in ipairs(jokers) do
                    card_destroyed(v,i,full_deck[index],full_deck_enhancement[index])
                end
                table.remove(stand_cards,stand_index)
                table.remove(stand_cards_enhancement,stand_index)
                table.remove(full_deck,index)
                table.remove(full_deck_enhancement,index)
            end
            cash = cash + 20
            general_used = true
        end
    elseif spectral_select[selected_card] == "Ankh" then
        local index = math.random(#jokers)
        local copy = {jokers[index],jokers[index]}
        local copy_enhancement = {jokers_enhancement[index],jokers_enhancement[index]}
        jokers = {}
        jokers_enhancement = {}
        for i,v in ipairs(copy) do
            table.insert(jokers,v)
            table.insert(jokers_enhancement,copy_enhancement[i])
        end
        general_used = true
    elseif spectral_select[selected_card] == "Familiar" then
        if #stand_cards>0 then
            local index = math.random(#stand_cards)
            for i,v in ipairs(jokers) do
                card_destroyed(v,i,stand_cards[index],stand_cards_enhancement[index])
            end
            table.remove(stand_cards,index)
            table.remove(stand_cards_enhancement,index)
            for i=1, 3 do
                local index2
                local value 
                repeat
                    index2 = math.random(#standard_deck)
                    value = standard_deck[index2]
                until string.sub(value,1,1) == "k" or string.sub(value,1,1) == "q" or string.sub(value,1,1) == "j"
                local num = convert_rank_to_num(string.sub(value,1,1))
                local addition = get_random_enhance()
                table.insert(stand_cards,standard_deck[index2])
                table.insert(stand_cards_enhancement,{num,addition})
                table.insert(full_deck,standard_deck[index2])
                table.insert(full_deck_enhancement,{num,addition})
            end
            general_used = true
        end
    elseif spectral_select[selected_card] == "Grim" then
        if #stand_cards>0 then
            local index = math.random(#stand_cards)
            for i,v in ipairs(jokers) do
                card_destroyed(v,i,stand_cards[index],stand_cards_enhancement[index])
            end
            table.remove(stand_cards,index)
            table.remove(stand_cards_enhancement,index)
            for i=1, 2 do
                local index2
                local value 
                repeat
                    index2 = math.random(#standard_deck)
                    value = standard_deck[index2]
                until string.sub(value,1,1) == "a"
                local num = convert_rank_to_num(string.sub(value,1,1))
                local addition = get_random_enhance()
                table.insert(stand_cards,standard_deck[index2])
                table.insert(stand_cards_enhancement,{num,addition})
                table.insert(full_deck,standard_deck[index2])
                table.insert(full_deck_enhancement,{num,addition})
            end
            general_used = true
        end
    elseif spectral_select[selected_card] == "Incantation" then
        if #stand_cards>0 then
            local index = math.random(#stand_cards)
            for i,v in ipairs(jokers) do
                card_destroyed(v,i,stand_cards[index],stand_cards_enhancement[index])
            end
            table.remove(stand_cards,index)
            table.remove(stand_cards_enhancement,index)
            for i=1, 4 do
                local index2
                local value
                repeat
                    index2 = math.random(#standard_deck)
                    value = standard_deck[index2]
                until tonumber(string.sub(value,1,1)) ~= nil
                local num = convert_rank_to_num(string.sub(value,1,1))
                local addition = get_random_enhance()
                table.insert(stand_cards,standard_deck[index2])
                table.insert(stand_cards_enhancement,{num,addition})
                table.insert(full_deck,standard_deck[index2])
                table.insert(full_deck_enhancement,{num,addition})
            end
            general_used = true
        end
    elseif spectral_select[selected_card] == "Wraith" then
        if #jokers<joker_size then
            add_jokers_to_selection(rare_joker[math.random(#rare_joker)],{})
            cash = 0
            general_used = true
        end
    elseif spectral_select[selected_card] == "Hex" then
        if #jokers >0 then
            local index = math.random(#jokers)
            local copy = jokers[index]
            local copy_enhancement = jokers_enhancement[index]
            for i = 3,#copy_enhancement do
                local v = copy_enhancement[i]
                local info = enhancement_info[v]
                if info ~= nil then
                    if info[2] == "Edition" and v~= "Negative" then
                        table.remove(copy,i)
                    end
                end
            end
            jokers = {}
            jokers_enhancement= {}
            table.insert(copy_enhancement, "Polychrome")
            table.insert(jokers,copy)
            table.insert(jokers_enhancement,copy_enhancement)
            general_used = true
        end
    elseif spectral_select[selected_card] == "Ectoplasm" then
        if #jokers>0 then
            local possible_jokers = {}
            for i,v in ipairs(jokers_enhancement) do
                local count = 0
                for j,k in ipairs(v) do
                    if enhancement_info[k] ~= nil then
                        if enhancement_info[k][2] ~= "Edition" then
                            count = count +1
                        end
                    end
                end
                if count == #v then
                    table.insert(possible_jokers,i)
                end
            end
            if #possible_jokers>0 then
                ecto_used = ecto_used +1
                local joker_index = math.random(#possible_jokers)
                table.insert(jokers_enhancement[joker_index],"Negative")
                max_hand_size = max_hand_size-ecto_used*(ecto_used+1)/2
                joker_size = joker_size+1
                general_used = true
            end
        end
    end
    if general_used == true then
        table.remove(spectral_select,selected_card)
    end
    return stand_cards, stand_cards_enhancement, spectral_select
end

function use_target_spectral(active_cards,active_cards_enhancement,stand_cards,stand_enhancement,spectral_select)
    if spectral_select[selected_card] == "Cryptid" then
        if #active_cards == 1 then
            for i =1 ,2 do
                table.insert(full_deck,active_cards[1])
                table.insert(full_deck_enhancement,active_cards_enhancement[1])
                if gameplay_phase == 1 then
                    table.insert(stand_cards,active_cards[1])
                    table.insert(stand_enhancement,active_cards_enhancement[1])
                end
            end
            table.remove(spectral_select,selected_card)
        end
    elseif spectral_select[selected_card] == "Aura" then--add 50% foil 35 holo 15 poly
        if #active_cards == 1 then
            local index = find_matching(1,active_cards,active_cards_enhancement)
            local rand = math.random()
            local addition 
            if rand<0.5 then
                addition = "Foil"
            elseif rand>=0.85 then
                addition = "Polychrome"
            else
                addition = "Holographic"
            end
            for i=2,#active_cards_enhancement[1] do
                local v = active_cards_enhancement[1][i]
                if enhancement_info[v][2] == "Edition" then
                    table.remove(active_cards_enhancement[1],i)
                    table.remove(full_deck_enhancement[index],i)
                    break
                end
            end
            --table.insert(active_cards_enhancement[1],addition)
            table.insert(full_deck_enhancement[index],addition)--not working, says not a table
            table.remove(spectral_select,selected_card)
        end
    elseif spectral_select[selected_card] == "Medium" then
        if #active_cards==1 then
            local index = find_matching(1,active_cards,active_cards_enhancement)
            for i=2,#active_cards_enhancement[1] do
                local v = active_cards_enhancement[1][i]
                if enhancement_info[v][2] == "Seal" then
                    table.remove(active_cards_enhancement[1],i)
                    table.remove(full_deck_enhancement[index],i)
                    break
                end
            end
            --table.insert(active_cards_enhancement[1],"Purple Seal")
            table.insert(full_deck_enhancement[index],"Purple-Seal")
            table.remove(spectral_select,selected_card)
        end
    elseif spectral_select[selected_card] == "Trance" then
        if #active_cards == 1 then
            local index = find_matching(1,active_cards,active_cards_enhancement)
            for i=2,#active_cards_enhancement[1] do
                local v = active_cards_enhancement[1][i]
                if enhancement_info[v][2] == "Seal" then
                    table.remove(active_cards_enhancement[1],i)
                    table.remove(full_deck_enhancement[index],i)
                    break
                end
            end
            --table.insert(active_cards_enhancement[1],"Blue Seal")
            table.insert(full_deck_enhancement[index],"Blue-Seal")
            table.remove(spectral_select,selected_card)
        end
    end
    for counter,v in ipairs(active_cards) do
        table.insert(stand_cards, v)
        table.insert(stand_enhancement,active_enhancement[counter])
    end
    stand_cards, stand_enhancement = sort_deck(stand_cards, stand_enhancement)
    active_cards = {}
    active_cards_enhancement = {}
    return active_cards,active_cards_enhancement,stand_cards, stand_enhancement,spectral_select
end

function open_pack()
    for i,v in ipairs(jokers) do
        if v == "Hallucination" then
            local rand = math.random()
            if rand<0.5 and #consumable<consumable_size then
                table.insert(consumable,tarots_deck[math.random(#tarots_deck)])
                table.insert(consumable_enhancement," ")
            end
        end
    end
    pack_count_now = 0
    kind = 4
    gameplay_phase = 4.5
    pack_interior = {}
    pack_interior_enhancement = {}
    pack_cards = {}
    pack_cards_enhancements = {}
    active = {}
    active_enhancement = {}
    local copy = {}
    local copy_enhancement = {}
    for i,v in ipairs(deck) do
        table.insert(copy,i,v)
        table.insert(copy_enhancement,i,deck_enhancement[i])
    end
    if name_pack == "celestial" then
        if telescope == true then
            local max_hand = ""
            local max_planet =""
            for k, t in pairs(hand_multipliers) do
                if t[3] >= hand_multipliers[max_hand][3] then
                    max_hand = k
                    max_planet = t[4]
                end
            end
            table.insert(pack_interior,max_planet)
        end
        for i=#pack_interior+1, cele_size do
            local index = math.random(2,#planets_deck)
            table.insert(pack_interior,planets_deck[index])
            table.remove(planets_deck,index)
        end
        reset_planets()
    elseif name_pack == "standard" then
        for i = 1, cele_size do
            local index = math.random(#standard_deck)
            table.insert(pack_interior,standard_deck[index])
            local num = convert_rank_to_num(string.sub(standard_deck[index],1,1))
            local addition = {num}
            for i,v in ipairs(shop_cards_enhancement_weight) do
                local rand = math.random()
                if rand<v then
                    if i ==1 then
                        local j = math.random(#card_enhancement)
                        table.insert(addition,card_enhancement[j])
                        break
                    elseif i == 2 then
                        local rand2 = math.random()
                        for j,k in ipairs(cards_edition_prob) do
                            if rand2 < k then
                                table.insert(addition,editions[j])
                                break
                            end
                        end
                    elseif i == 3 then
                        local j = math.random(#seals)
                        table.insert(addition,seals[j])
                        break
                    end
                end
            end
            table.insert(pack_interior_enhancement,addition)
        end
    elseif name_pack == "bufoon" then
        for i = 1, cele_size do
            local rand = math.random()
            local rarity
            if rand <0.70 then
                rarity = common_joker
            elseif rand>=0.95 then
                rarity = rare_joker
            else
                rarity = uncommon_joker
            end
            local randomvalue = math.random(#rarity)
            table.insert(pack_interior, rarity[randomvalue])
        end
    elseif name_pack == "arcana" then--add probability of soul card
        for i = 1, hand_size do
            local index = math.random(#copy)
            table.insert(pack_cards,copy[index])
            table.insert(pack_cards_enhancements,copy_enhancement[index])
            table.remove(copy,index)
            table.remove(copy_enhancement,index)
        end
        for i = 1, cele_size do
            local index = math.random(#tarots_deck)
            table.insert(pack_interior,tarots_deck[index])
            table.insert(pack_interior_enhancement,"")
        end
    elseif name_pack == "spectral" then
        for i =1, hand_size do
            local index = math.random(#copy)
            table.insert(pack_cards,copy[index])
            table.insert(pack_cards_enhancements,copy_enhancement[index])
            table.remove(copy,index)
            table.remove(copy_enhancement,index)
        end
        for i =1, cele_size do
            local rand = math.random()
            if rand < 0.003 then
                table.insert(pack_interior,"Black Hole")
                table.insert(pack_interior_enhancement,"")
            elseif rand < 0.006 and rand>= 0.003  then
                table.insert(pack_interior,"The Soul")
                table.insert(pack_interior_enhancement,"")
            else
                local index = math.random(#spectral_deck)
                table.insert(pack_interior,spectral_deck[index])
                table.insert(pack_interior_enhancement,"")
            end
        end
    end
end

function tag_immediate()
    for i,v in ipairs(tag_select) do--change to while loopo to deal with the removal issue
        if v == "Economy" then
            if cash >=40 then
                cash = cash + 40
            elseif cash >0 and cash <40 then
                cash = cash*2
            end
        table.remove(tag_select,i)
        i = i -1--done to not skip elements 
        elseif v == "Juggle" then
            hands = hands + 3
            table.remove(tag_select,i)
            i=i-1
        elseif v == "Double" and #tag_select >1 then--improve for interacting with double
            tag_select[i] = tag_select[i+1]
            tag_immediate()
        elseif v == "Charm" then
            prev_phase = 1
            cele_size = 5
            type_pack = 3
            name_pack = "arcana"
            table.remove(tag_select,i)
            i=i-1
            open_pack()
        elseif v == "Standard" then
            prev_phase = 1
            cele_size = 5
            type_pack = 3
            name_pack = "standard"
            table.remove(tag_select,i)
            i=i-1
            open_pack()
        elseif v == "Meteor" then
            prev_phase = 1
            cele_size = 5
            type_pack = 3
            name_pack = "celestial"
            table.remove(tag_select,i)
            i=i-1
            open_pack()
        elseif v == "Bufoon" then
            prev_phase = 1
            cele_size = 5
            type_pack = 3
            name_pack = "bufoon"
            table.remove(tag_select,i)
            i=i-1
            open_pack()
        elseif v == "Boss" then
            set_boss_blind()
            calculate_minimum_score()
            boss_col, boss_info = get_boss_info()
            table.remove(tag_select,i)
            i=i-1
        elseif v == "Ethereal" then
            prev_phase = 1
            cele_size = 4
            type_pack = 3
            name_pack = "spectral"
            table.remove(tag_select,i)
            i=i-1
            open_pack()
        elseif v == "Top-Up" then
            local goal = joker_size-#jokers
            local count = 0
            while count<goal and count<2 do
                add_jokers_to_selection(common_joker[math.random(#common_joker)],{})
            end
        elseif v == "Orbital" then
            local maximum = 0 
            local plan_hand
            local planet
            for k, v in pairs(hand_multipliers) do
                if v[3]>maximum then
                    maximum = v[3]
                    plan_hand = k
                    planet = v[4]
                end
            end
            for i = 1, 3 do
                hand_multipliers[plan_hand][1] = hand_multipliers[plan_hand][1] + planets_info[planet][1]
                hand_multipliers[plan_hand][2] = hand_multipliers[plan_hand][2] + planets_info[planet][2] 
            end
            table.remove(tag_select,i)
            i=i-1
        elseif v == "Speed" then
            cash = cash + no_blinds_skipped*5
        elseif v == "Handy" then
            cash = cash + no_hands_played
        elseif v == "Garbage" then
            cash = cash +no_discards_used
        elseif v == "Uncommon" then
            local card = uncommon_joker[math.random(#uncommon_joker)]
            table.insert(shop_jokers,card)
            table.insert(shop_jokers_enhancement,{0})
            table.remove(tag_select,i)
        elseif v == "Rare" then
            local card = rare_joker[math.random(#rare_joker)]
            table.insert(shop_jokers,card)
            table.insert(shop_jokers_enhancement,{0})
            table.remove(tag_select,i)
        end
    end
end

function tag_shop()
    for i,v in ipairs(tag_select) do
        if v == "D6" then
            reroll_price = 0
            table.remove(tag_select,i)
        elseif v == "Voucher" then
            local rand_voucher
            repeat
                rand_voucher = math.random(#vouchers)
            until vouchers[math.random(#vouchers)] ~= voucher_show[1]
            table.insert(voucher_show,vouchers[math.random(#vouchers)])
            table.remove(tag_select,i)
        elseif v =="Coupon" then
            local total = 0
            for i,v in ipairs(shop_jokers) do
                total = total + shop_jokers_enhancement[i][1]
            end
            for i,v in ipairs(packs) do
                type_pack = packs[i][2]
                total = total + math.floor(shop_costs[5][type_pack]*discount_percent)
            end
            cash = cash + total
        end
        jokers_editions_tag(v,i)
    end
end

function jokers_editions_tag(tag,index)
    if tag == "Foil" then
        local shop_index = {}
        for i,v in ipairs(shop_jokers) do
            if joker_info[v] ~= nil then
                table.insert(shop_index,i)
            end
        end
        for i,v in ipairs(shop_index) do
            if #shop_jokers_enhancement[v] < 2 then
                table.insert(shop_jokers_enhancement[v],2,"Foil")
                shop_jokers_enhancement[v][1] = 0
                table.remove(tag_select,index)
                break
            else
                if enhancement_info[shop_jokers_enhancement[v][2]][2] ~= "Edition" then
                    table.insert(shop_jokers_enhancement[v],2,"Foil")
                    shop_jokers_enhancement[v][1] = 0
                    table.remove(tag_select,index)
                    break 
                end
            end
        end
    elseif tag == "Polychrome" then
        local shop_index = {}
        for i,v in ipairs(shop_jokers) do
            if joker_info[v] ~= nil then
                table.insert(shop_index,i)
            end
        end
        for i,v in ipairs(shop_index) do
            if #shop_jokers_enhancement[v] < 2 then
                table.insert(shop_jokers_enhancement[v],2,"Polychrome")
                shop_jokers_enhancement[v][1] = 0
                table.remove(tag_select,index)
                break
            else
                if enhancement_info[shop_jokers_enhancement[v][2]][2] ~= "Edition" then
                    table.insert(shop_jokers_enhancement[v],2,"Polychrome")
                    shop_jokers_enhancement[v][1] = 0
                    table.remove(tag_select,index)
                    break 
                end
            end
        end
    elseif tag == "Holographic" then
        local shop_index = {}
        for i,v in ipairs(shop_jokers) do
            if joker_info[v] ~= nil then
                table.insert(shop_index,i)
            end
        end
        for i,v in ipairs(shop_index) do
            if #shop_jokers_enhancement[v] < 2 then
                table.insert(shop_jokers_enhancement[v],2,"Holographic")
                shop_jokers_enhancement[v][1] = 0
                table.remove(tag_select,index)
                break
            else
                if enhancement_info[shop_jokers_enhancement[v][2]][2] ~= "Edition" then
                    table.insert(shop_jokers_enhancement[v],2,"Holographic")
                    shop_jokers_enhancement[v][1] = 0
                    table.remove(tag_select,index)
                    break 
                end
            end
        end 
    elseif tag == "Negative" then
        local shop_index = {}
        for i,v in ipairs(shop_jokers) do
            if joker_info[v] ~= nil then
                table.insert(shop_index,i)
            end
        end
        for i,v in ipairs(shop_index) do
            if #shop_jokers_enhancement[v] < 2 then
                table.insert(shop_jokers_enhancement[v],2,"Negative")
                shop_jokers_enhancement[v][1] = 0
                table.remove(tag_select,index)
                break
            else
                if enhancement_info[shop_jokers_enhancement[v][2]][2] ~= "Edition" then
                    table.insert(shop_jokers_enhancement[v],2,"Negative")
                    shop_jokers_enhancement[v][1] = 0
                    table.remove(tag_select,index)
                    break 
                end
            end
        end
    end
end

function played_enhancement(card_enhanced)
    for i,v in ipairs(card_enhanced) do
        if v == "Bonus" then
            chips = chips+30
        elseif v == "Mult" then
            multiplier = multiplier+4
        elseif v == "Glass" then
            multiplier = multiplier*2
            local broken = math.random()
            if broken <0.25 then
                local i = 0
                repeat
                    i = i+1
                until full_deck[i] == hand[j] and full_deck_enhancement[i] == hand_enhancement[j]
                table.remove(full_deck,i)
                table.remove(full_deck_enhancement,i)
                i =i-1
            end
        elseif v == "Lucky" then
            local money = math.random()
            local mult_add = math.random()
            if mult_add < 0.2 then
                multiplier = multiplier +20
            end
            if money < 1/15 then
                cash = cash +20
            end
        elseif v == "Foil" then
            chips = chips+20
        elseif v == "Holographic" then
            multiplier = multiplier + 10
        elseif v =="Polychrome" then
            multiplier = multiplier*1.5
        elseif v == "Gold-Seal" then
            cash = cash + 3
        elseif v == "Red-Seal" then
            --retrigger once
        end
    end
end

function held_enhancement(card_enhanced)-- dont actually need as a function but is a bit neater
    for i,v in ipairs(card_enhanced) do
        if v == "Steel" then
            multiplier = multiplier*1.5
        end 
    end
end

function discard_enhancements(card_enhanced)
    for i,v in ipairs(card_enhanced) do
        if v == "Purple-Seal" then
            if #consumable<consumable_size then
                local rand = math.random(#tarots_deck)
                table.insert(consumable,tarots_deck[rand])
                table.insert(consumable_enhancement," ")
            end
        end 
    end
end

function round_end_enhancement()
    for j,k in ipairs(dealt_enhancement) do
        for i,v in ipairs(k) do
            if v == "Gold" then
                cash = cash + 3
            elseif v == "Blue-Seal" then
                local plan_type = ""
                if #consumable<consumable_size then
                    for k,v in pairs(planets_info)do
                        if v[3] == hand_type then
                            plan_type = k
                            break
                        end
                    end
                    table.insert(consumable,plan_type)
                    table.insert(consumable_enhancement," ")
                end
            end
        end
    end
end

hard_reset()

while not Keys.newPress.Select do
    Controls.read()
    if scene == "menu" then
        selected_deck = bounds(deck_able,selected_deck)
        selected_stake = bounds(stakes,selected_stake)
        draw_title_screen()
        if Keys.newPress.Left then
            selected_deck = selected_deck - 1
        elseif Keys.newPress.Right then
            selected_deck = selected_deck + 1
        end
        if Keys.newPress.X then
            selected_stake = selected_stake+1
        elseif Keys.newPress.B then
            selected_stake = selected_stake-1
        end
        if Keys.newPress.Y then
            if seeded_run == false then
                seeded_run = true
            else
                seeded_run = false
                seeded_num = 0
            end
        end
        if seeded_run == true then
            if Keys.held.Up then
                seeded_num= seeded_num +1
            elseif Keys.held.Down and seeded_num>0 then
                seeded_num = seeded_num -1
            end
        end
        if Keys.newPress.A then
            if seeded_run == true then
                math.randomseed(seeded_num)
            else
                math.randomseed(os.time())
            end
            scene = "game"
            deck_name = deck_able[selected_deck]
            stake_name = stakes[selected_stake]
            get_deck(deck_name)
            get_deck_adjust(deck_name)
            stake_begin(stake_name)
            soft_reset()
        end
    elseif scene == "game" then
        screen.drawFillRect(SCREEN_UP, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, Color.new256(0, 153, 76))--green backgorund
        screen.drawFillRect(SCREEN_DOWN, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, Color.new256(0, 153, 76))
        phase_2_update()
        if gameplay_phase ~= 2.5 then--not drawing joker and tarot on pause menu for clarity
            draw_joker_card_graphic()
            draw_tarots_graphics()
        end
        if first ~= 0 then
            movement()
        end
        if gameplay_phase == 0 then--initialise for first blind
            for i=1,#boss_blind_locked do
                local index = #boss_blind_locked+1-i
                local v = boss_blind_locked[index]
                if boss_blind_description[v][3] == ante then
                    table.insert(boss_blind,v)
                    table.remove(boss_blind,index)
                end
            end
            if ante == 2 then
                for i,v in ipairs(tag_unlock_2) do
                    table.insert(tag_deck,v)
                end
            end
            for i =1, 2 do
                local tag_num = math.random(#tag_deck)
                table.insert(blind_tags,tag_deck[tag_num])
            end
            voucher_show = {}
            if ante == 1 then
                repeat
                    table.remove(voucher_show,1)
                    table.insert(voucher_show, vouchers[math.random(#vouchers)])
                until voucher_show[1] ~= "Heiroglyph" --heiroglyph not possible on ante 1 bc not set ante 0 score
            else
                table.insert(voucher_show, vouchers[math.random(#vouchers)])
            end
            set_boss_blind()
            calculate_minimum_score()
            boss_col, boss_info = get_boss_info()
            gameplay_phase = 1
        elseif gameplay_phase == 1 then--chossing blind
            draw_blind_menu()
            draw_boss_menu()
            if Keys.newPress.X and cash > 10 and boss_reroll==true then
                if total_boss_reroll ~= boss_reroll_num then
                    boss_reroll_num = boss_reroll_num+1
                    set_boss_blind()
                    calculate_minimum_score()
                    boss_col, boss_info = get_boss_info()
                    cash = cash - 10
                end
            end

            if Keys.newPress.A then
                gameplay_phase = 2
                for i, v in ipairs(jokers) do
                    selected_blind_jokers(v,i)
                end
                last_played_hand = ""
                hands = max_hands--may move soft reset
                discards = max_discards
                hand_size = max_hand_size
                if blind == 3 and boss_active == true then
                    if ante%8 == 0 then
                        if finisher_blinds[boss_num] == "Cerulean Bell" and boss_active == true then
                            local rand = math.random(#dealt)
                            table.insert(hand,dealt[false])
                            table.insert(hand_enhancement,dealt_enhancement[rand])
                        elseif finisher_blinds[boss_num] == "Amber Acorn" and boss_active == true then
                            local temp_jokers = {}
                            local temp_jokers_enhancement = {}
                            for i = 1, #jokers do
                                local index = math.random(#jokers)
                                table.insert(temp_jokers,jokers[index])
                                table.insert(temp_jokers_enhancement,jokers_enhancement[index])
                                table.remove(jokers,index)
                                table.remove(jokers_enhancement,index)
                            end
                            jokers = temp_jokers
                            jokers_enhancement = temp_jokers_enhancement
                        end
                    else
                        if boss_blind[boss_num] == "The Needle" then
                            hands = 1
                        elseif boss_blind[boss_num] == "The Manacle" then
                            hand_size = hand_size - 1
                        elseif boss_blind[boss_num] == "The Water" then
                            discards = 0
                        end
                    end
                end
                add_to_dealt()
                dealt,dealt_enhancement = sort_deck(dealt,dealt_enhancement)
            end

            if Keys.newPress.Y then
                if blind < 3 then
                    no_blinds_skipped = no_blinds_skipped+1
                    table.insert(tag_select,blind_tags[blind])
                    blind = blind + 1
                    tag_immediate()
                end
            end
            if Keys.newPress.Start then--game menu to look at deck/volume etc
                prev_phase = gameplay_phase
                gameplay_phase = 2.5
            end

        elseif gameplay_phase == 2 then--choosing hand
            draw_card_deck_graphic(dealt, selected_card, "dealt")
            draw_card_base_graphic((SCREEN_WIDTH-card_size[1])/2,0,1,{})--card for deck
            screen.print(SCREEN_DOWN, (SCREEN_WIDTH-card_size[1])/2+2, 7,#deck, Color.new(0,0,0))
            if #hand ~= 0 then
                draw_card_deck_graphic(hand, selected_card, "hand")
                local hand_description = ""
                local x_space = math.floor(SCREEN_WIDTH/(#hand_enhancement+1))
                for i,v in ipairs(hand_enhancement) do
                    local status_string = ""
                    for j,k in ipairs(v) do
                        status_string= status_string..k.." "
                    end
                    local x = x_space*i
                    local indv_status = text_width(status_string,1)--not always displaying best but works for now
                    for a,b in ipairs(indv_status) do
                        screen.print(SCREEN_DOWN,x-card_size[1],SCREEN_HEIGHT/3-10*(a-2),b,colours[1])
                    end
                end
                screen.print(SCREEN_DOWN,(SCREEN_WIDTH-6*string.len(hand_description))/2,SCREEN_HEIGHT/3,hand_description,colours[1])
            end

            if kind == 1 then
                selected_card = bounds(dealt,selected_card)
            elseif kind == 2 then
                selected_card = bounds(jokers,selected_card)
            elseif kind == 3 then
                selected_card = bounds(consumable,selected_card)
            end

            card_details(kind)

            if Keys.newPress.Left then
                selected_card = selected_card - 1
            elseif Keys.newPress.Right then
                selected_card = selected_card + 1
            end

            if Keys.newPress.L then
                sort_mode = false
                dealt,dealt_enhancement = sort_deck(dealt,dealt_enhancement)
            elseif Keys.newPress.R then
                sort_mode = true
                dealt, dealt_enhancement = sort_deck(dealt,dealt_enhancement)
            end
            
            if Keys.newPress.X then
                kind = kind + 1
                first = 0
                selected_card = 1
                if kind > 3 then
                    kind = 1
                end
            end

            if Keys.newPress.B then
                if kind == 1 then
                    move_action(dealt,dealt_enhancement)
                elseif kind == 2 then
                    move_action(jokers,jokers_enhancement)
                elseif kind == 3 then
                    dealt,dealt_enhancement = use_consumable_non_target(dealt,dealt_enhancement)
                    if #hand > 0 and general_used == false then
                        hand, hand_enhancement, dealt,dealt_enhancement = use_consumable_target(hand, hand_enhancement, dealt,dealt_enhancement)
                    end
                end
            end

            if Keys.newPress.Up and #hand < 5 then
                table.insert(hand, dealt[selected_card])
                table.insert(hand_enhancement,dealt_enhancement[selected_card])
                table.remove(dealt, selected_card)
                table.remove(dealt_enhancement, selected_card)
                hand_type = get_hand_type(hand)
                chips = hand_multipliers[hand_type][1]
                multiplier = hand_multipliers[hand_type][2]
                dealt,dealt_enhancement = sort_deck(dealt,dealt_enhancement)
            end

            if Keys.newPress.Down then
                for i=1,#hand do
                    if #hand == 1 and ante%8 == 0 then--not tested
                        if blind == 3 and finisher_blinds[boss_num] == "Cerulean Bell" and boss_active == true then
                            break
                        end
                    end
                    table.insert(dealt, hand[#hand])
                    table.insert(dealt_enhancement, hand_enhancement[#hand])
                    table.remove(hand_enhancement,#hand)
                    table.remove(hand,#hand)
                end
                dealt,dealt_enhancement = sort_deck(dealt,dealt_enhancement)
                chips = 0
                multiplier = 0
                hand_type = ""
            end
            if #hand > 0 and hands > 0 then
                can_play_hand = true
            else 
                can_play_hand = false
            end

            if #hand > 0 and discards > 0 then
                can_discard = true
            else
                can_discard = false
            end

            if Keys.newPress.Y then
                if can_discard and kind == 1 then
                    no_discards_used = no_discards_used+1
                    for j,k in ipairs(jokers) do
                        discard_jokers(k,j)
                    end
                    for i,v in ipairs(hand) do
                        discard_enhancements(hand_enhancement[i])
                    end
                    hand = {}
                    hand_enhancement = {}
                    add_to_dealt()
                    if blind == 3 and ante%8 == 0 then
                        if finisher_blinds[boss_num] == "Cerulean Bell" and boss_active == true then
                            local rand = math.random(#dealt)
                            table.insert(hand,dealt[false])
                            table.insert(hand_enhancement,dealt_enhancement[rand])
                        end
                    end
                    dealt,dealt_enhancement = sort_deck(dealt,dealt_enhancement)
                    discards = discards - 1
                elseif kind == 2 then
                    sell_jokers(jokers[selected_card],selected_card)
                elseif kind == 3 then
                    local i = 0
                    repeat
                        i=i+1
                    until consumable_deck[i][consumable[selected_card]] ~= nil
                    cash = cash + math.floor(shop_costs[i+1]*discount_percent/2)
                    if consumable_enhancement[selected_card] == "Negative" then
                        consumable_size = consumable_size-1
                    end
                    table.remove(consumable, selected_card)
                    table.remove(consumable_enhancement, selected_card)
                end
            end
            if blind == 3 and boss_active == true then
                if boss_blind[boss_num] == "The Mouth" and last_played_hand ~= hand_type and hands < max_hands then
                    can_play_hand = false
                elseif boss_blind[boss_num] == "The Psychic" and #hand ~= 5 then
                    can_play_hand = false
                elseif boss_blind[boss_num] == "The Eye" then
                    for i,v in ipairs(played_hand_type) do
                        if hand_type == v then
                            can_play_hand = false
                        end
                    end
                end
            end
            if Keys.newPress.A then
                if can_play_hand and kind == 1 then
                    last_played_hand = hand_type
                    no_hands_played = no_hands_played+1
                    for k,v in pairs(locked_planets) do
                        if locked_planets[last_played_hand] ~= nil then
                            table.insert(full_planets,v)
                            table.insert(planets_deck,v)
                            locked_planets[k] = nil
                        end
                    end
                    table.insert(played_hand_type,hand_type)
                    gameplay_phase = 3
                    --Sound.pause()
                    --Sound.startSFX(0)
                    --Sound.startSFX(1)
                    --Sound.resume()
                    selected_card = -1
                    hands = hands - 1
                end
            end
            if Keys.newPress.Start then--game menu to look at deck/volume etc
                prev_phase = 2
                gameplay_phase = 2.5
            end
        elseif gameplay_phase == 2.5 then--game menu
            local index_menu_details = {"Show Deck","Show Hand Types","Show Enhancments", "Adjust Volume", "Retire Run"}
            screen.print(SCREEN_UP, SCREEN_WIDTH/2 -5,SCREEN_HEIGHT/3,"Main Menu",Color.new(0,0,0))
            for i,v in ipairs(index_menu_details) do
                screen.print(SCREEN_UP, SCREEN_WIDTH/2 -5,SCREEN_HEIGHT/3+10*(i),v,Color.new(31,31,31))
            end
            index_menu = bounds(index_menu_details,index_menu)
            screen.drawFillRect(SCREEN_UP, SCREEN_WIDTH/2 - 15, SCREEN_HEIGHT/3+10*index_menu, SCREEN_WIDTH/2 - 6, SCREEN_HEIGHT/3+10*(index_menu)+7, Color.new(0, 0, 0))
            if index_menu_details[index_menu] == "Show Deck" then
                for i,v in ipairs(deck) do--cards in deck
                    if string.sub(v,2,2) == "h" then
                        deck_y = SCREEN_HEIGHT/5
                    elseif string.sub(v,2,2) == "d" then
                        deck_y = 2*SCREEN_HEIGHT/5
                    elseif string.sub(v,2,2) == "s" then
                        deck_y = 3*SCREEN_HEIGHT/5
                    elseif string.sub(v,2,2) == "c" then
                        deck_y = 4*SCREEN_HEIGHT/5
                    else
                        deck_y = 4.5*SCREEN_HEIGHT/5
                    end
                screen.print(SCREEN_DOWN, 20 + 13*position(string.sub(v,1,1)), deck_y, v)-- works now but not when added cards, random issue 3/4/25 nil value arithmetic
                end
                for i,v in ipairs(used_cards)do--cards used or in dealt
                    if string.sub(v,2,2) == "h" then
                        deck_y = SCREEN_HEIGHT/5
                    elseif string.sub(v,2,2) == "d" then
                        deck_y = 2*SCREEN_HEIGHT/5
                    elseif string.sub(v,2,2) == "s" then
                        deck_y = 3*SCREEN_HEIGHT/5
                    elseif string.sub(v,2,2) == "c" then
                        deck_y = 4*SCREEN_HEIGHT/5
                    else
                        deck_y = 4.5*SCREEN_HEIGHT/5
                    end
                    screen.print(SCREEN_DOWN, 20 + 13*position(string.sub(v,1,1)), deck_y, v, Color.new(31,0,0))-- works now but not when added cards
                end
            elseif index_menu_details[index_menu] == "Show Hand Types" then
                local i = 1
                screen.print(SCREEN_DOWN, SCREEN_WIDTH/4 ,10,"Poker Hand")
                screen.print(SCREEN_DOWN, 2*SCREEN_WIDTH/3-20 ,10,"Chips",Color.new(0,0,31))
                screen.print(SCREEN_DOWN, 3*SCREEN_WIDTH/4 ,10,"Mult",Color.new(31,0,0))
                screen.print(SCREEN_DOWN, SCREEN_WIDTH/5 ,10,"#",Color.new(0,0,0))
                for k,v in pairs(hand_multipliers) do
                    if k == "" then
                        goto continue
                    end
                    screen.print(SCREEN_DOWN, SCREEN_WIDTH/4, 10+ 12*i, k)
                    screen.print(SCREEN_DOWN, 2*SCREEN_WIDTH/3-20, 10+12*i, v[1],Color.new(0,0,31))
                    screen.print(SCREEN_DOWN, 3*SCREEN_WIDTH/4, 10+12*i, v[2],Color.new(31,0,0))
                    screen.print(SCREEN_DOWN, SCREEN_WIDTH/5, 10+12*i, v[3],Color.new(0,0,0))
                    i = i +1
                    ::continue::
                end
            elseif index_menu_details[index_menu] == "Show Enhancments" then
                if Keys.newPress.B then
                    enhancement_kind = enhancement_kind+1
                    if enhancement_kind >4 then
                        enhancement_kind = 1
                    end
                elseif Keys.newPress.Y then
                    enhancement_kind = enhancement_kind-1
                    if enhancement_kind <1 then
                        enhancement_kind = 4
                    end
                end
                screen.print(SCREEN_DOWN,SCREEN_WIDTH/5,10,"B/Y: Cycle enhancement type",Color.new(0,0,31))
                local total_enhancement = {{"Gold","Steel","Glass","Lucky","Mult","Stone"},{"Polychrome", "Holographic","Foil","Negative"},seals,{"Eternal","Perishable","Rental"}}
                local descriptor = {"1 available on playing cards", "1 available on playing cards, Negative possible on jokers or consumables","1 available on playing cards","Applies to jokers, available on certain stakes"}
                local enhancement_kind = bounds(total_enhancement,enhancement_kind)
                local spacer = 0
                for i,v in ipairs(total_enhancement[enhancement_kind])do
                    screen.print(SCREEN_DOWN,5,10+10*i+spacer,v..":",Color.new(31*(i%2),31*(i%2),31*(i%2)))
                    local to_print = text_width(enhancement_info[v][1],SCREEN_WIDTH/(2*6))
                    for j,k in ipairs(to_print) do
                        screen.print(SCREEN_DOWN,SCREEN_WIDTH/3,10*(i+j)+spacer,k,Color.new(31*(i%2),31*(i%2),31*(i%2)))
                    end
                    spacer = spacer+10*(#to_print-1)
                end
                local descript = text_width(descriptor[enhancement_kind],3*SCREEN_WIDTH/(5*6))
                for i,v in ipairs(descript) do
                    screen.print(SCREEN_DOWN,SCREEN_WIDTH/4,SCREEN_HEIGHT-30+10*(i-1),v,Color.new(0,0,31))
                end
            elseif index_menu_details[index_menu] == "Adjust Volume" then
                if Keys.newPress.B then
                    if music_vol == true then
                        music_vol = false
                    else
                        music_vol = true
                    end
                end
                if Keys.held.Right then
                    if music_vol == true then
                        MOD_volume =  MOD_volume + 0.01
                        if MOD_volume > 1 then
                            MOD_volume = 1
                        end
                    elseif music_vol == false then
                        SFX_volume = SFX_volume + 0.01
                        if SFX_volume > 1 then
                            SFX_volume = 1
                        end
                    end
                elseif Keys.held.Left then
                    if music_vol == true then
                        MOD_volume = MOD_volume - 0.01
                        if MOD_volume < 0 then
                            MOD_volume = 0
                        end
                    elseif music_vol == false then
                        SFX_volume = SFX_volume - 0.01
                        if SFX_volume < 0 then
                            SFX_volume = 0
                        end
                    end
                end
                if music_vol then
                    screen.drawFillRect(SCREEN_DOWN,SCREEN_WIDTH/3,SCREEN_HEIGHT/2,SCREEN_WIDTH/3+30,SCREEN_HEIGHT/2+10,Color.new(0,0,0))
                else
                    screen.drawFillRect(SCREEN_DOWN,2*SCREEN_WIDTH/3,SCREEN_HEIGHT/2,2*SCREEN_WIDTH/3+20,SCREEN_HEIGHT/2+10,Color.new(0,0,0))
                end
                screen.print(SCREEN_DOWN,SCREEN_WIDTH/3, 5, "B: Switch type", Color.new(0,0,0))
                screen.print(SCREEN_DOWN, SCREEN_WIDTH/3, SCREEN_HEIGHT/2, "Music")
                screen.print(SCREEN_DOWN, SCREEN_WIDTH/3, SCREEN_HEIGHT/2+10, MOD_volume*100)
                screen.print(SCREEN_DOWN, 2*SCREEN_WIDTH/3, SCREEN_HEIGHT/2, "SFX")
                screen.print(SCREEN_DOWN, 2*SCREEN_WIDTH/3, SCREEN_HEIGHT/2+10, SFX_volume*100)
            elseif index_menu_details[index_menu] == "Retire Run"  then
                screen.print(SCREEN_DOWN, 70, SCREEN_HEIGHT/2, "Hold A to retire run")
                if Keys.held.A then
                    index_menu = 1
                    scene = "menu"
                    hard_reset()--may need soft reset
                end
            end
            if Keys.newPress.Up then
                index_menu= index_menu - 1
            elseif Keys.newPress.Down then
                index_menu= index_menu + 1
            end
            if Keys.newPress.Start then
                index_menu = 1
                gameplay_phase = prev_phase
                if gameplay_phase == 4 then
                    kind = 1.5
                elseif gameplay_phase == 4.5 then
                    kind = 4
                else 
                    kind = 1
                end
                Sound.setModVolume(math.floor(600*MOD_volume))
                Sound.setSFXVolume(0,math.floor(255*SFX_volume))
                Sound.setSFXVolume(1,math.floor(255*SFX_volume))
            end
        elseif gameplay_phase == 3 then--playing hand
            can_play_hand = false
            can_discard = false
            interest = 0
            cash_out = 0
            for k,v in pairs(hand_multipliers) do
                if k == hand_type then
                    hand_multipliers[hand_type][3] = hand_multipliers[hand_type][3]+1
                    break
                end
            end
            val = calculate_total_score(hand) 
            round_score = round_score + val
            hand = {}
            hand_enhancement = {}
            if hands == 0 and round_score < minimumscore[blind] then
                for i,v in ipairs(jokers) do
                    if v == "Mr Bones" and round_score >=minimumscore[blind]/4 then
                        gameplay_phase=3.5
                        interest = math.Clamp(math.floor(cash / 5), 0, max_interest)
                        cash_out = interest
                        shop_jokers = {}
                    end 
                end
                if gameplay_phase ~= 3.5 then
                    lose()
                end
            elseif round_score >= minimumscore[blind] then
                for i,v in ipairs(jokers) do
                    round_end_jokers(v,i)
                end
                round_end_enhancement()
                gameplay_phase = 3.5
                interest = math.Clamp(math.floor(cash / 5), 0, max_interest)
                cash_out = blind_payouts[blind] + hands*hand_cash + discards*discard_cash + interest
                shop_jokers = {}
                if blind == 3 then
                    if deck_name == "Anaglyph" then
                        table.insert(tag_select,"Double")
                    end
                    for i,v in ipairs(tag_select) do
                        if v == "Investment" then
                            cash = cash +25
                        end
                    end
                end
            else
                gameplay_phase = 2
                add_to_dealt()
                if blind == 3 and ante%8 == 0 then
                    if finisher_blinds[boss_num] == "Cerulean Bell" and boss_active == true then
                        local rand = math.random(#dealt)
                        table.insert(hand,dealt[false])
                        table.insert(hand_enhancement,dealt_enhancement[rand])
                    end
                end
                dealt,dealt_enhancement = sort_deck(dealt,dealt_enhancement)
            end
        elseif gameplay_phase == 3.5 then--cash_out
            draw_cashout()
            if Keys.newPress.A then
                reset_deck()
                used_cards={}
                gameplay_phase = 4
                round_score = 0
                cash = cash + cash_out
                for i=1, 2 do
                    local p_type = 0
                    local p_size = 0
                    local initial_rand = math.random()--may be some edge case weirdness idk cba to figure out atm
                    local second_rand = math.random()
                    repeat
                        p_type = p_type + 1
                        initial_rand = initial_rand - type_base_prob[p_type]
                    until initial_rand <= 0
                    repeat
                        p_size = p_size + 1
                        second_rand = second_rand - size_base_prob[p_size]
                    until second_rand <= 0
                    table.insert(packs,{pack_type[p_type],p_size,p_type})
                end
                round = round +1
                kind = 1.5
                selected_card = 1
                add_to_shop()
                tag_shop()
                for i,v in ipairs(jokers) do
                    if v == "Chaos the Clown" then
                        reroll_price = 0
                    end
                end
            end
        elseif gameplay_phase == 4 then--shop
            if kind == 1.5 then
                selected_card = bounds(shop_jokers,selected_card)
            elseif kind == 2 then
                selected_card = bounds(jokers,selected_card)
            elseif kind == 2.5 then
                selected_card = bounds(packs,selected_card)
            elseif kind == 3 then--already bought not to buy
                selected_card = bounds(consumable,selected_card)
            elseif kind == 3.5 then
                selected_card = bounds(voucher_show,selected_card)
            end
            draw_shop()
            card_details(kind)
            if Keys.newPress.Left then
                selected_card = selected_card - 1
            elseif Keys.newPress.Right then
                selected_card = selected_card + 1
            end

            if Keys.newPress.Up then
                kind = kind + 0.5
                first = 0
                selected_card = 1
                if kind > 3.5 then
                    kind = 1.5
                end
            end

            if Keys.newPress.Down then
                kind = kind - 0.5
                first = 0
                selected_card = 1
                if kind < 1.5 then
                    kind = 3.5
                end
            end

            if Keys.newPress.Y then--sell or buy 
                if kind == 1.5 then--shop_joker
                    if joker_info[shop_jokers[selected_card]] ~= nil then
                        if #shop_jokers > 0 and cash >= shop_jokers_enhancement[selected_card][1] + min_cash then
                            local negative_shop = false
                            for i,v in ipairs(shop_jokers_enhancement[selected_card]) do
                                if v == "Negative" then
                                    negative_shop = true
                                    break
                                end
                            end
                            if negative_shop == true then
                                cash = cash - shop_jokers_enhancement[selected_card][1]
                                add_jokers_to_selection(shop_jokers[selected_card],shop_jokers_enhancement[selected_card])
                                table.remove(shop_jokers, selected_card)
                                table.remove(shop_jokers_enhancement, selected_card)
                                selected_card = 1
                            elseif negative_shop == false and #jokers < joker_size then
                                cash = cash - shop_jokers_enhancement[selected_card][1]
                                add_jokers_to_selection(shop_jokers[selected_card],shop_jokers_enhancement[selected_card])
                                table.remove(shop_jokers, selected_card)
                                table.remove(shop_jokers_enhancement, selected_card)
                                selected_card = 1
                            end
                        end
                    elseif string.len(shop_jokers[selected_card]) == 2 then--may be a better way, works for now
                        local costs, num,detail1,detail2,detail3 = table.unpack(shop_jokers_enhancement[selected_card])--number and 3 max enhancement/edition/seal if not 3 they default to nil
                        if cash >= costs + min_cash then
                            cash = cash - costs
                            table.insert(full_deck, shop_jokers[selected_card])
                            table.insert(full_deck_enhancement,{num,detail1,detail2,detail3})
                            table.remove(shop_jokers, selected_card)
                            table.remove(shop_jokers_enhancement, selected_card)
                            selected_card = 1
                            reset_deck()
                        end
                    else
                        local i = 0
                        repeat
                            i=i+1
                        until consumable_deck[i][shop_jokers[selected_card]] ~= nil
                        if cash >= shop_jokers_enhancement[selected_card][1] + min_cash and #consumable<consumable_size then--issue with the 2nd consumable picked
                            cash = cash - shop_jokers_enhancement[selected_card][1]
                            table.insert(consumable,shop_jokers[selected_card])
                            table.insert(consumable_enhancement," ")
                            table.remove(shop_jokers, selected_card)
                            table.remove(shop_jokers_enhancement, selected_card)
                        end
                    end
                elseif kind == 2 then--joker
                    sell_jokers(jokers[selected_card],selected_card)
                elseif kind == 2.5 then--packs
                    name_pack = packs[selected_card][1]
                    type_pack = packs[selected_card][2]
                    local cost = math.floor(shop_costs[5][type_pack]*discount_percent)
                    if cash >= cost + min_cash and #packs > 0  then
                        cash = cash - cost
                        prev_phase = 4
                        if name_pack == "standard" or name_pack == "arcana" or name_pack == "celestial" then
                            if type_pack == 1 then
                                cele_size = 3
                            else
                                cele_size = 5
                            end
                        else
                            if type_pack == 1 then
                                cele_size = 2
                            else
                                cele_size = 4
                            end
                        end
                        table.remove(packs,selected_card)
                        selected_card=1
                        open_pack()
                    end
                elseif kind == 3 then--consumable
                    local i = 0
                    repeat
                        i=i+1
                    until consumable_deck[i][consumable[selected_card]] ~= nil
                        cash = cash + math.floor(shop_costs[i+1]*discount_percent/2)
                        if consumable_enhancement[selected_card] == "Negative" then
                            consumable_size = consumable_size-1
                        end
                    table.remove(consumable, selected_card)
                    table.remove(consumable_enhancement, selected_card)
                elseif kind == 3.5 then--voucher                        
                    table.insert(jokers_enhancement,{})
                    if cash >= shop_costs[#shop_costs] + min_cash then
                        cash = cash - shop_costs[#shop_costs]
                        use_vouchers(voucher_show[selected_card])
                        table.remove(voucher_show,selected_card)
                        kind = 1.5
                    end
                end
            end

            if Keys.newPress.B then
                if kind == 2 then
                    move_action(jokers,jokers_enhancement)
                elseif kind == 3 then
                    local pack_cards_4 = {}
                    local pack_cards_enhancements_4 ={}
                    pack_cards_4,pack_cards_enhancements_4 = use_consumable_non_target(pack_cards_4,pack_cards_enhancements_4)
                end
            end

            if Keys.newPress.X and cash >= reroll_price then
                cash = cash - reroll_price
                for i,v in ipairs(jokers) do
                    if v == "Chaos the Clown" and reroll_price == 0 then
                        reroll_price = min_reroll
                    end
                end
                reroll_price = reroll_price + 1
                shop_jokers = {}
                shop_jokers_enhancement = {}
                add_to_shop()
                for i,v in ipairs(tag_select) do
                    jokers_editions_tag(v,i)
                end
            end

            if Keys.newPress.A then
                kind = 1
                if blind == 3 then
                    boss_reroll_num = 0
                    blind = 1
                    ante = ante +1
                    blind_tags = {}
                    gameplay_phase = 0
                else
                    blind = blind + 1
                    gameplay_phase = 1
                end
                for i, v in ipairs(jokers) do
                    shop_end_jokers(v,i)
                end
                soft_reset()
                collectgarbage("collect")
            end

            if Keys.newPress.Start then--game menu to look at deck volume etc
                prev_phase = gameplay_phase
                gameplay_phase = 2.5
            end
        elseif gameplay_phase == 4.5 then--packs
            screen.print(SCREEN_DOWN,SCREEN_WIDTH/3,SCREEN_HEIGHT-card_size[2]/2,"X: Skip")
            screen.print(SCREEN_DOWN,2*SCREEN_WIDTH/3,SCREEN_HEIGHT-card_size[2]/2,"B: Use")
            local pack_count_tot = 1--number of cards to pick
            if type_pack == 3 then
                pack_count_tot = 2
            end
            screen.print(SCREEN_DOWN,SCREEN_WIDTH/3,card_size[2],"Choose "..pack_count_tot-pack_count_now)
            local y_pack_pos
            if name_pack == "arcana" or name_pack == "spectral" then
                y_pack_pos= SCREEN_HEIGHT-2*card_size[2]
                if kind > 4 then
                    kind =1
                elseif kind <1 then
                    kind = 4
                end
            else
                y_pack_pos = SCREEN_HEIGHT/2
                if kind > 4 then
                    kind =2
                elseif kind <2 then
                    kind = 4
                end
            end

            if name_pack == "celestial" then
                for i = 1, #pack_interior do
                    screen.print(SCREEN_DOWN, SCREEN_WIDTH*(i)/(cele_size+1),y_pack_pos,pack_interior[i])
                end
            elseif name_pack == "standard" then
                for i,v in ipairs(pack_interior) do
                    local rank_c = string.sub(v,1,1)
                    local suit_c = string.sub(v,2,2)
                    draw_card_base_graphic(SCREEN_WIDTH*(i)/(cele_size+1),y_pack_pos,1,pack_interior_enhancement[i])
                    draw_card_detail(SCREEN_WIDTH*(i)/(cele_size+1),y_pack_pos,1,rank_c,suit_c)
                end
            elseif name_pack == "bufoon" then
                local joke_index = 0
                for i,v in ipairs(pack_interior) do
                    joke_index = joker_info[v][3]
                    if joke_index~= 99 then
                        screen.blit(SCREEN_DOWN, SCREEN_WIDTH*(i)/(cele_size+1),y_pack_pos, joker_graphics, card_size[1]*(joke_index-1),0, card_size[1], card_size[2])
                    else
                        screen.drawFillRect(SCREEN_DOWN,SCREEN_WIDTH*(i)/(cele_size+1),y_pack_pos,SCREEN_WIDTH*(i)/(cele_size+1)+card_size[1],y_pack_pos+card_size[2],colours[3])
                    end
                end
            elseif name_pack == "arcana" then
                for i,v in ipairs(active) do
                    local rank_c = string.sub(v,1,1)
                    local suit_c = string.sub(v,2,2)
                    draw_card_base_graphic(SCREEN_WIDTH*(i)/(hand_size+1),SCREEN_HEIGHT/3,1,active_enhancement[i])
                    draw_card_detail(SCREEN_WIDTH*(i)/(hand_size+1),SCREEN_HEIGHT/3,1,rank_c,suit_c)
                end
                for i,v in ipairs(pack_cards) do
                    local rank_c = string.sub(v,1,1)
                    local suit_c = string.sub(v,2,2)
                    draw_card_base_graphic(SCREEN_WIDTH*(i)/(hand_size+1),SCREEN_HEIGHT/2,1,pack_cards_enhancements[i])
                    draw_card_detail(SCREEN_WIDTH*(i)/(hand_size+1),SCREEN_HEIGHT/2,1,rank_c,suit_c)
                end
                for i,v in ipairs(pack_interior) do
                    screen.drawFillRect(SCREEN_DOWN, SCREEN_WIDTH*(i)/(cele_size+1),y_pack_pos, SCREEN_WIDTH*(i)/(cele_size+1)+card_size[1],y_pack_pos+card_size[2],colours[5])
                end
            elseif name_pack == "spectral" then
                for i,v in ipairs(active) do
                    local rank_c = string.sub(v,1,1)
                    local suit_c = string.sub(v,2,2)
                    draw_card_base_graphic(SCREEN_WIDTH*(i)/(hand_size+1),SCREEN_HEIGHT/3,1,active_enhancement[i])
                    draw_card_detail(SCREEN_WIDTH*(i)/(hand_size+1),SCREEN_HEIGHT/3,1,rank_c,suit_c)
                end
                for i,v in ipairs(pack_cards) do
                    local rank_c = string.sub(v,1,1)
                    local suit_c = string.sub(v,2,2)
                    draw_card_base_graphic(SCREEN_WIDTH*(i)/(hand_size+1),SCREEN_HEIGHT/2,1,pack_cards_enhancements[i])
                    draw_card_detail(SCREEN_WIDTH*(i)/(hand_size+1),SCREEN_HEIGHT/2,1,rank_c,suit_c)
                end
                for i,v in ipairs(pack_interior) do
                    screen.drawFillRect(SCREEN_DOWN, SCREEN_WIDTH*(i)/(cele_size+1),y_pack_pos, SCREEN_WIDTH*(i)/(cele_size+1)+card_size[1],y_pack_pos+card_size[2],Color.new(0,0,31))
                end
            end
            if kind == 4 then
                if Keys.newPress.B then
                    local initial_len = #pack_interior
                    if name_pack == "celestial" then
                        local plan_hand = planets_info[pack_interior[selected_card]]
                        hand_multipliers[plan_hand[3]][1] = hand_multipliers[plan_hand[3]][1] + plan_hand[1]
                        hand_multipliers[plan_hand[3]][2] = hand_multipliers[plan_hand[3]][2] + plan_hand[2]
                        last_used_consumable = pack_interior[selected_card]
                        table.remove(pack_interior,selected_card)
                        total_planets = total_planets+1
                    elseif name_pack == "standard" then
                        table.insert(full_deck, pack_interior[selected_card])
                        table.insert(full_deck_enhancement, pack_interior_enhancement[selected_card])
                        table.remove(pack_interior,selected_card)
                        table.remove(pack_interior_enhancement,selected_card)
                    elseif name_pack == "bufoon" and #jokers < joker_size then
                        add_jokers_to_selection(pack_interior[selected_card],{joker_info[pack_interior[selected_card]][1]})
                        table.remove(pack_interior,selected_card)
                    elseif name_pack == "arcana" then
                        pack_interior  = use_tarots(pack_interior)
                        if #active ~= 0 and general_tarot == false then
                            active, active_enhancement, pack_cards, pack_cards_enhancements, pack_interior = use_target_tarots(active,active_enhancement,pack_cards,pack_cards_enhancements,pack_interior)
                        end
                    elseif name_pack == "spectral" then
                        pack_cards,pack_cards_enhancements, pack_interior = use_spectral(pack_cards,pack_cards_enhancements, pack_interior)
                        if #active ~= 0 and general_used == false then
                            active, active_enhancement, pack_cards, pack_cards_enhancements,pack_interior= use_target_spectral(active, active_enhancement, pack_cards, pack_cards_enhancements,pack_interior)
                        end
                    end
                    if #pack_interior ~= initial_len then--checking whether something was used
                        pack_count_now = pack_count_now + 1 
                    end
                    if pack_count_now == pack_count_tot then
                        gameplay_phase = prev_phase
                        selected_card = 1
                        reset_deck()
                        active = {}
                        active_enhancement = {}
                        pack_interior = {}
                        pack_interior_enhancement = {}
                        if prev_phase == 1 then
                            kind = 1
                        elseif prev_phase == 4 then
                            kind = 1.5
                        end
                    end
                end
                selected_card = bounds(pack_interior,selected_card)
            elseif kind == 1 then
                if Keys.newPress.A then
                    table.insert(active_enhancement,pack_cards_enhancements[selected_card])
                    table.insert(active,pack_cards[selected_card])
                    table.remove(pack_cards_enhancements,selected_card)
                    table.remove(pack_cards,selected_card)
                elseif Keys.newPress.Y then
                    for i, v in ipairs(active) do
                        table.insert(pack_cards,v)
                        table.insert(pack_cards_enhancements,active_enhancement[i])
                    end
                    active = {}
                    active_enhancement = {}
                end
                selected_card = bounds(pack_cards,selected_card)
            elseif kind == 2 then
                if Keys.newPress.Y then
                    sell_jokers(jokers[selected_card],selected_card)
                end
                if Keys.newPress.B then
                    move_action(jokers,jokers_enhancement)
                end
                selected_card = bounds(jokers,selected_card)
            elseif kind == 3 then
                if Keys.newPress.B then--issue after using it thinks kind = 4 and uses a tarot
                    pack_cards,pack_cards_enhancements = use_consumable_non_target(pack_cards,pack_cards_enhancements)
                    if #active>0 and general_used == false then
                        active,active_enhancement,pack_cards,pack_cards_enhancements = use_consumable_target(active,active_enhancement,pack_cards,pack_cards_enhancements,consumable)
                    end
                elseif Keys.newPress.Y then
                    local i = 0
                    repeat
                        i=i+1
                    until consumable_deck[i][consumable[selected_card]] ~= nil
                    cash = cash + math.floor(shop_costs[1+i]*discount_percent/2)
                    if consumable_enhancement[selected_card] == "Negative" then
                        consumable_size = consumable_size-1
                    end
                    table.remove(consumable_enhancement, selected_card)
                    table.remove(consumable, selected_card)
                end
                selected_card = bounds(consumable,selected_card)
            end
            card_details(kind)
            if Keys.newPress.Up then
                kind = kind +1
                selected_card = 1
            elseif Keys.newPress.Down then
                kind = kind-1
                selected_card = 1
            end
        
            if Keys.newPress.Left then
                selected_card = selected_card - 1
            elseif Keys.newPress.Right then
                selected_card = selected_card + 1
            end
            if Keys.newPress.X then--without buying
                for i,v in ipairs(jokers) do
                    if v == "Red Card" then
                        jokers_enhancement[i][1] = jokers_enhancement[i][1] + 3--do with brainstorm and bluprint
                    end
                end
                gameplay_phase = prev_phase
                selected_card = 1
                reset_deck()
                active = {}
                active_enhancement = {}
                pack_interior = {}
                pack_interior_enhancement = {}
                if prev_phase == 4 then
                    kind = 1.5
                elseif prev_phase == 1 then
                    kind = 1
                end
            end
        elseif gameplay_phase == 5 then--game over
            if Keys.newPress.A then
                gameplay_phase = 0
                scene = "menu"
                hard_reset()--may need soft reset not sure
            end
            screen.setAlpha(40)
            screen.drawFillRect(SCREEN_DOWN, 0, 0, 256, 192, Color.new256(0, 255, 0))
            screen.drawFillRect(SCREEN_UP, 80, 0, 256, 192, Color.new256(0, 255, 0))
            screen.setAlpha(100)
            screen.drawFillRect(SCREEN_DOWN, 31, 63, 228, 192, Color.new256(255, 255, 255))
            screen.drawFillRect(SCREEN_DOWN, 34, 64, 225, 96, Color.new256(49, 49, 51))
            screen.drawFillRect(SCREEN_DOWN, 32, 66, 227, 192, Color.new256(49, 49, 51))
            screen.drawFillRect(SCREEN_DOWN, 36, 66, 223, 96, Color.new256(39, 39, 46))
            screen.drawFillRect(SCREEN_DOWN, 36, 154, 223, 192, Color.new256(39, 39, 46))
            screen.print(SCREEN_DOWN, 54, 172, "PRESS A TO RETURN TO MENU", Color.new(31, 31, 31))
            joker_graphic = Sprite.new(joker_graphics, 19, 28, VRAM)
            screen.blit(SCREEN_DOWN, 64, 112, card_graphic)
            joker_graphic:drawFrame(SCREEN_DOWN, 64, 112, 0)
            if win then
                screen.print(SCREEN_DOWN, 88, 118, "Good thing I didnt", Color.new(31, 31, 31))
                screen.print(SCREEN_DOWN, 88, 128, "bet against you!", Color.new(31, 31, 31))
                screen.print(SCREEN_DOWN, 106, 76, "YOU WIN!", Color.new(31, 31, 31))
            else
                screen.print(SCREEN_DOWN, 88, 118, "We folded like a", Color.new(31, 31, 31))
                screen.print(SCREEN_DOWN, 88, 128, "cheap suit!", Color.new(31, 31, 31))
                screen.print(SCREEN_DOWN, 96, 76, "YOU LOSE...", Color.new(31, 31, 31))
            end
        end
    end
    render()
end
collectgarbage("collect")

Sound.unloadSFX(1)--unload in reverse order
Sound.unloadSFX(0)
Sound.unloadMod(0)
Sound.unloadBank()
Image.destroy(img_packs)
Image.destroy(logo)
Image.destroy(menubg)
Image.destroy(shop_sheet)
Image.destroy(tutorial_sheet)
Image.destroy(blind_ui_box)
Image.destroy(blind_ui)
Image.destroy(hud)
Image.destroy(hudbg)
Image.destroy(joker_graphics)
for k,v in pairs(suit_graphics) do--not reversed
    Image.destroy(v)
end
for k,v in pairs(rank_graphics) do--not reversed
    Image.destroy(v)
end
Image.destroy(card_graphic)