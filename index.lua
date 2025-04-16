scene = "menu"--need to add how to add enhancement to deck table.insert(full_deck,{},i),table.insert(full_deck[i],"blueSeal")

deck_able = {"Red", "Blue" , "Yellow", "Green", "Black", "Magic", "Nebula", "Ghost", "Abandoned", "Checkered", "Zodiac", "Painted", "Anaglyph", "Plasma", "Erratic", "Rainbow"}--need achievements for locked
locked_deck = { "Blue","Yellow", "Green", "Black", "Magic", "Nebula", "Ghost", "Abandoned", "Checkered", "Zodiac", "Painted", "Anaglyph", "Plasma", "Erratic"}
deck_details = {
    ["Red"] = "Start with 1 additional discard",
    ["Blue"] = "Start with 1 additional hand",
    ["Yellow"] = "Start with $10",
    ["Green"] = "At end of each Round: $2 per remaining Hand, $1 per remaining Discard, Earn no Interest",
    ["Black"] = "+1 Joker slot, -1 hand",
    ["Magic"] = "Start with +1 consumable slot and 2 copies of The Fool",
    ["Nebula"] = "Start run with telescope voucher, -1 consumable slot",--not properly tested
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

stakes = {"White", "Red", "Green", "Blue", "Purple"}
stake_not_in = {"Black", "Orange", "Gold"}--not implemented

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

screen_size = {256,192}--x,y size of ds screen
card_size = {19,28}
hud_width = 80
colours = {Color.new(31,31,31),Color.new256(153,0,204), Color.new256(102,0,102),Color.new256(0,50,170) ,Color.new256(153,76,0)}--cards, shop_jokers, jokers, packs,consumable
card_graphic = Image.load("sprites/cards/card.png", VRAM)
--card_shadow_graphic = Image.load("sprites/cards/card_shadow.png", VRAM)

blind_multis = {1, 1.5, 2} --used for minimumscore

normal_blind = {{"Small Blind", Color.new256(62, 125, 201)}, {"Big Blind", Color.new256(236, 50, 62)}}

boss_blind_debuf = {"", "", "", "", "", "", "", "", "c", "s", "d", "h"}

boss_blind = {"The Wall", "The Psychic", "The Hook", "The Needle", "The Tooth", "The Manacle", "The Mouth", "The Plant", "The Club", "The Goad", "The Window", "The Head"}

boss_blind_description = {
    ["The Wall"] = {Color.new256(138, 89, 165),"Extra Large Blind"}, --double boss blind value
    ["The Psychic"] = {Color.new256(239, 192, 60),"Must Play 5 Cards"},
    ["The Hook"] = {Color.new256(168, 64, 36),"Discards 2 Cards Every Hand"},
    ["The Needle"] = {Color.new256(92, 110, 49),"Only 1 Hand"}, --small blind value
    ["The Tooth"] = {Color.new256(181, 45, 45),"Lose $1 per Hand Played."}, 
    ["The Manacle"] = {Color.new256(87, 87, 87),"-1 Hand Size"},
    ["The Mouth"] = {Color.new256(174, 113, 142),"Only 1 Hand Type Can Be Played"}, 
    ["The Plant"] = {Color.new256(112, 146, 132),"All Face Cards are Debuffed"},
    ["The Club"] = {Color.new256(185, 203, 146),"All Clubs are Debuffed"}, 
    ["The Goad"] = {Color.new256(185, 92, 150),"All Spades are Debuffed"}, 
    ["The Window"] = {Color.new256(169, 162, 149),"All Diamonds are Debuffed"},
    ["The Head"] = {Color.new256(172, 157, 180),"All Hearts are Debuffed"}
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
    ["8 Ball"] = {5,"1 in 4 chance for each played 8 to create a Tarot card when scored",99}
}

joker_deck = {
    "Joker", "Gluttonous Joker", "Wrathful Joker", "Lusty Joker", "Greedy Joker", "Jolly Joker", "Zany Joker", "Mad Joker", "Crazy Joker", "Droll Joker", "Sly Joker", "Clever Joker", "Half Joker", "Joker Stencil", "Banner","Willy Joker", "Devious Joker", "Crafty Joker", "Mystic Summit","Misprint","Blue Joker","Abstract Joker", "Business Card", "8 Ball"
}
joker_toadd = {"Credit Card", "Raised Fist", "Chaos the Clown", "Scary Face", "Delayed Gratification", "Gros Michel", "Even Steven", "Odd Todd", "Scholar", "Runner", "Ice Cream", "Splash", "Square Joker", "Riff-Raff"}

planets_deck = {"","Pluto", "Mercury", "Uranus", "Venus", "Saturn", "Jupiter", "Earth", "Mars", "Neptune"}
full_planets = {"","Pluto", "Mercury", "Uranus", "Venus", "Saturn", "Jupiter", "Earth", "Mars", "Neptune"}--used for reset
locked_planets = {--unlocked when played not tested
    ["5 of a Kind"]="Planet X",
    ["Flush House"]="Ceres",
    ["Flush Five"]="Eris"
}

planets_info = {
    [""] = {0,0,nil},
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
type_base_prob = {20/3,20/3,20/3,2,1}
size_base_prob = {4,2,1}
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

tarots_deck = {"The Fool", "The Magician", "The High Priestess","The Empress", "The Emperor", "The Heirophant", "The Chariot", "Justice", "The Hermit", "Wheel of Fortune", "Strength", "The Hanged Man", "Death", "Temperence", "The Devil", "The Star","The Moon", "The Sun", "Judgement","The World"}--non targeting implemented
tarots_info = {
    ["The Fool"] = "Creates the last Tarot or Planet card used during this run",
    ["The Magician"] = "convert up to 2 cards to Lucky cards",
    ["The High Priestess"] = "Creates up to 2 planet cards",
    ["The Empress"] = "Convert up to 2 cards to Mult cards",
    ["The Emperor"] = "Creates up to 2 tarot cards",
    ["The Heirophant"] = "Converts up to 2 cards to Bonus cards",
    ["The Chariot"] = "Convert 1 card into a Steel card",
    ["Justice"] = "Convert 1 card into a Glass card",
    ["The Hermit"] = "Double money (max $20)",
    ["The Wheel of fortune"] = "1 in 4 cahnce to give a random joker Foil, Holographic or Polychrome",
    ["Strength"] = "Increase the rank on up to 2 cards by 1",
    ["The Hanged Man"] = "Destroy up to 2 Cards",
    ["Death"] = "Convert the left card into the right card",
    ["Temperence"] = "Gives total sell value of all jokers (max $50)",
    ["The Devil"] = "Convert 1 card into a Gold card",
    ["The Star"] = "Convert up to 3 cards to Diamonds",
    ["The Moon"] = "Convert up to 3 cards to Clubs",
    ["The Sun"] = "Convert up to 3 cards to Hearts",
    ["Judgement"] = "creates a random joker (must have room)",
    ["The World"] = "Convert up to 3 cards to Spades"
}

spectral_deck = {"Familiar","Grim", "Incantation", "Aura", "Sigil", "Ouija", "Immolate", "Ankh", "Hex", "Trance", "Cryptid", }
spectral_info = {
    ["Familiar"] = "Destroy 1 random card in hand but add 3 random enchanted face cards",
    ["Grim"] = "Destroy 1 random card in hand but add 2 random enchanted ace cards",
    ["Incantation"] = "Destroy 1 random card in hand but add 4 random numbered cards",
    ["Aura"] = "Add Foil, Holographic or Polychrome to a selected card in hand",
    ["Siigil"] = "Convert all cards in hand to a single random suit",
    ["Ouija"] = "Convert all cards in hand to a single random rank but -1 hand size",
    ["Immolate"] = "Destroy 5 random cards in hand, gain $20",
    ["Ankh"] = "Creates an exact copy of 1 of your Jokers at random, then destroys the others",
    ["Hex"] = "Add Polychrome to a random joker but destroys the rest",
    ["Trance"] = "Add a blue seal to a selected card",
    ["Cryptid"] = "Create 2 exact copies of a selected card",
    ["The Soul"] = "Create a legendary Joker",--0.3% chance
    ["Black Hole"] = "Increase all poker hands by 1 level"--0.3% chance
}

consumable_deck = {tarots_info,planets_info,spectral_info}

vouchers_info = {
    ["Overstock"] = "Up to 3 Card slots in shop",
    ["Clearence Sale"] = "All cards in shop are 25% off",
    ["Reroll Surplus"] = "Rerolls cost $2 less",
    ["Crystal Ball"] = "+1 consumable slot",
    ["Grabber"] = "+1 hand permanently",
    ["Wasteful"] = "+1 discard permanently",
    ["Seed Money"] = "interest capped at $10",
    ["Heiroglyph"] = "-1 ante, -1 hand",
    ["Director's Cut"] = "Reroll boss blind for $10",
    ["Paint Brush"] = "+1 hand size",
    ["Tarot Merchant"] = "Tarot appear 2x as often",
    ["Planet Merchant"] = "Planets appear 2x as often",
    ["Telescope"] = "Most common poker hand always shows up in celestial packs",
    ["Magic Trick"] = "Playing Cards can be purchased from the shop"
}

tag_deck = {"Economy", "Speed", "D6", "Juggle", "Double","Charm","Boss", "Voucher", "Investment"}
tag_unlock_2 = {"Standard", "Meteor", "Bufoon", "Orbital"}
tag_info = {
    ["Economy"] = "Doubles your money (Max $40)",
    ["Speed"] = "Gain $5 for number of blinds skipped",
    ["D6"] = "In next shop rerolls start at $0",
    ["Juggle"] = "+3 hands next round only",
    ["Double"] = "Gains copy of next tag selected",
    ["Charm"] = "Open a Mega arcana pack immediately",
    ["Boss"] = "Reroll boss blind",
    ["Voucher"] = "Add Voucher to shop if possible",
    ["Investment"] = "Gain $25 after defeating boss blind",
    ["Uncommon"] = "Adds a free uncommon joker to shop",
    ["Standard"] = "Open a Mega standard pack immediately",
    ["Meteor"] = "Open a Mega Celestial pack",
    ["Bufoon"] = "Open a Mega Bufoon pack",
    ["Orbital"] = "Upgrade a randomly selected Poker Hand by 3 levels: "--make it show what hand will upgrade
}

card_enhancement = {"Gold","Steel","Glass","Lucky","Mult"}
editions = {"Foil", "Polychrome", "Holographic"}
seals = {"Gold Seal", "Blue Seal"}

enhancement_info = {
    ["Gold"] = {"Gain $3 if held at round end","Enhancment"},
    ["Steel"] = {"x1.5 mult if held when hand played","Enhancement"},
    ["Glass"] = {"x2 mult and 25% chance to break when played","Enhancement"},
    ["Mult"] = {"+4 mult","Enhancement"},
    ["Lucky"] = {"x1.5 mult: 1 in 5 chance, $20: 1 in 15 chance when played","Enhancement"},
    ["Foil"] = {"+50 chips","Edition"},
    ["Polychrome"] = {"x1.5 mult","Edition"},
    ["Holographic"] = {"+10 mult","Edition"},
    ["Negative"] = {"+1 joker slot","Edition"},
    ["Gold Seal"] = {"$3 when scoring", "Seal"},
    ["Blue Seal"] = {"Planet card of winning hand added to consumable slot if held in hand","Seal"}
}
shop_costs = {1,3,3,4,{4,6,8},10}--playing cards,tarots,planets,spectral,packs,vouchers
shop_weights = {20,4,4}--joker,tarots,planets
shop_locked_weights = {4,2}--playing cards, spectral
shop_tot_prob = 0
for i,v in ipairs(shop_weights) do 
    shop_tot_prob = shop_tot_prob + v
end
for i,v in ipairs(shop_weights) do
    shop_weights[i] = v/shop_tot_prob
end

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
Image.scale(menubg, screen_size[1], screen_size[2])
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
    packs = {}
    consumable = {}
    general_tarot = false
    card_alter = {}
    jokers = {}--minimal implemented
    jokers_enhancement = {}
    last_played_hand = ""
    logo_bop = -120
    kind = 1
    boss_reroll = false
    joker_size = 5
    max_hands = 4
    max_discards = 3
    max_hand_size = 8
    min_reroll = 5
    selected_card = 1
    selected_deck = 1
    selected_stake = 1
    seeded_run = false
    seeded_num = 0
    hand_multipliers = {
        [""] = {0, 0, 0},--chips,mult, times played
        ["High Card"] = {5, 1, 0},
        ["Pair"] = {10, 2, 0},
        ["Two Pair"] = {20, 2, 0},
        ["3 of a Kind"] = {30, 3, 0},
        ["Straight"] = {30, 4, 0},
        ["Flush"] = {35, 4, 0},
        ["Full House"] = {40, 4, 0},
        ["4 of a Kind"] = {60, 7, 0},
        ["Straight Flush"] = {100, 8, 0},
        ["5 of a Kind"] = {120, 12, 0},
        ["Flush House"] = {140, 14, 0},
        ["Flush Five"] = {160, 16, 0}
    }
    ante_bases = {300, 800, 2000, 5000, 11000, 20000, 35000, 50000, 110000, 560000, 72e5, 3e8, 47e9, 2.9e13, 7.7e16, 8.6e20, 4,2e25, 9.2e30, 9.2e36, 4.3e43, 9.7e50, 1e59, 5.8e67, 1.6e77, 2.4e87,1.9e98, 8.4e109, 2e122, 2.7e135, 2.1e149, 9.9e163, 2.7e179, 4.4e195, 4.4e212, 2.8e230, 1.1e249, 2.7e268,4.5e288, 4.8e309}
    blind_payouts = {3, 4, 5}--money
    vouchers = {"Overstock", "Clearence Sale", "Reroll Surplus", "Crystal Ball", "Grabber", "Wasteful", "Seed Money", "Heiroglyph", "Director's Cut", "Paint Brush", "Tarot Merchant", "Planet Merchant", "Telescope", "Magic Trick"}--all cost $10
    full_deck_enhancement = {}
end

function soft_reset()--done when increasing blind/ante
    round_score = 0
    hand = {}
    hand_enhancement = {}
    dealt = {}
    dealt_enhancement = {}
    shop_jokers = {}
    shop_jokers_enhancement = {}
    used_cards = {}
    packs = {}
    pack_enhancement = {}
    selected_card = 1
    first = 0
    hands = max_hands
    discards = max_discards
    chips = 0
    multiplier = 0
    reroll_price = min_reroll
    hand_size = max_hand_size
    hand_type = ""
    win = false
    sort_mode = false--false = rank , true = suit
    can_play_hand = false
    can_discard = false
    reset_deck()
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
        use_vouchers("Crystal Ball")
    elseif deck_name == "Nebula" then
        consumable_size = consumable_size-1
        use_vouchers("Telescope")
    elseif deck_name == "Ghost" then
        table.insert(shop_weights,shop_locked_weights[2])
        table.insert(consumable,"Hex")
    elseif deck_name == "Zodiac" then
        use_vouchers("Overstock")
        use_vouchers("Tarot Merchant")
        use_vouchers("Planet Merchant")
    elseif deck_name == "Painted" then
        max_hand_size = max_hand_size + 2
        joker_size = joker_size -1
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
    if deck_name == "Rainbow" then
        full_deck_enhancement = {}
        for i=1,#full_deck do
            local addition = get_random_enhance()
            table.insert(full_deck_enhancement,{addition})
        end
    else
        full_deck_enhancement = {}
        for i=1,#full_deck do
            table.insert(full_deck_enhancement,{})
        end
    end
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

function hand_ignore(handplay, unique,rank_dupe,no_cards,card_count)
    local count = 0
    local i = 1
    local count_ignore = {}
    while count<#handplay-card_count do
        for j = 1, #unique-no_cards do
            if  rank_dupe[position(string.sub(handplay[i],1,1))] < unique[#unique] then--indexing issues
                count = count + 1
                table.insert(count_ignore,count,handplay[i])
            end
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
        if rank_dupe[ranked[i]] == nil then
            rank_dupe[ranked[i]] = 1
        else
            rank_dupe[ranked[i]] = rank_dupe[ranked[i]] + 1
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

    if suited[1] == suited[#hand_play] and #hand_play == 5 then
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
        no_cards = 1
        ignore = hand_ignore(hand_play,unique,rank_dupe,no_cards,card_count)
        return "4 of a Kind"
    end

    if #unique == 1 and unique[1] == 3 then
        card_count = 3
        return "3 of a Kind"
    elseif #unique == 2 and unique[2] == 3 then
        card_count = 3
        no_cards = 1
        ignore = hand_ignore(hand_play,unique,rank_dupe,no_cards,card_count)
        return "3 of a Kind"
    elseif #unique == 3 and unique[3] == 3 then
        card_count = 3
        no_cards = 1
        ignore = hand_ignore(hand_play,unique,rank_dupe,no_cards,card_count)
        return "3 of a Kind"
    end

    if  #unique == 2 and unique[1] == unique[2] and #hand_play == 4 then
        card_count = 4
        return "Two Pair"
    elseif #unique == 3 and unique[2] == unique[3] and #hand_play == 5 then
        card_count = 4
        no_cards = 2
        ignore = hand_ignore(hand_play,unique,rank_dupe,no_cards,card_count)
        return "Two Pair"
    end

    if #unique == 1 and unique[1] == 2 then
        card_count = 2
        no_cards = 1
        return "Pair"
    elseif #unique == 2 and unique[2] == 2 then
        card_count = 2
        no_cards = 1
        ignore = hand_ignore(hand_play,unique,rank_dupe,no_cards,card_count)
        return "Pair"
    elseif #unique == 3 and unique[3] == 2 then
        card_count = 2
        no_cards = 1
        ignore = hand_ignore(hand_play,unique,rank_dupe,no_cards,card_count)
        return "Pair"
    elseif #unique == 4 and unique[4] == 2 then
        card_count = 2
        no_cards = 1
        ignore = hand_ignore(hand_play,unique,rank_dupe,no_cards,card_count)
        return "Pair"
    end

    ignore = {}
    for i,v in ipairs(hand_play) do
        if position(string.sub(v,1,1)) ~= ranked[#ranked] then
            ignore[#ignore+1] = v
        end
    end
    return "High Card"
end

function per_card_joker(joker, card)
    if joker == "Wrathful Joker" then
        if string.sub(card, 2, 2) == "s" then
            multiplier = multiplier + 3
        end
    elseif joker == "Greedy Joker" then
        if string.sub(card, 2, 2) == "d" then
            multiplier = multiplier + 3
        end
    elseif joker == "Lusty Joker" then
        if string.sub(card, 2, 2) == "h" then
            multiplier = multiplier + 3
        end
    elseif joker == "Gluttonous Joker" then
        if string.sub(card, 2, 2) == "c" then
            multiplier = multiplier + 3
        end
    elseif joker == "Business Card" then
        if string.sub(card,1,1) == "j" or string.sub(card,1,1) == "q" or string.sub(card,1,1) == "k" then
            local rand = math.random()
            if rand <0.5 then
                cash = cash + 2
            end
        end
    elseif joker == "8 ball" then
        if string.sub(card,1,1) == "8" then
            local rand = math.random()
            if rand < 0.25 and #consumable < consumable_size then
                local rand_tarot = math.random(#tarots_deck)
                table.insert(consumable,tarots_deck[rand_tarot])
            end
        end
    end
end

function final_jokers(joker) 
    if joker == "Jolly Joker" then
        if conatins_pair == true then
            multiplier = multiplier + 8
        end
    elseif joker == "Zany Joker" then
        if contains_3 == true then
            multiplier = multiplier + 12
        end
    elseif joker == "Mad Joker" then
        if contains_2pair == true then
            multiplier = multiplier + 10
        end
    elseif joker == "Crazy Joker" then
        if straight == true then
            multiplier = multiplier + 12
        end
    elseif joker == "Droll Joker" then
        if flush == true then
            multiplier = multiplier + 10
        end
    elseif joker == "Sly Joker" then
        if conatins_pair == true then
            chips = chips + 50
        end
    elseif joker == "Clever Joker" then
        if contains_2pair == true then
            chips = chips + 80
        end
    elseif joker == "Half Joker" then
        if #hand < 4 then
            multiplier = multiplier + 20
        end
    elseif joker == "Willy Joker" then
        if contains_3 == true then
            chips = chips + 100
        end
    elseif joker == "Crafty Joker" then
        if flush == true then
            chips = chips +80
        end
    elseif joker == "Mystic Summit" then
        if discards == 0 then
            multiplier = multiplier + 15 
        end
    elseif joker == "Misprint" then
        chips = chips + math.random(0,23)
    elseif joker == "Devious Joker" then
        if straight == true then
            chips = chips +100
        end
    elseif joker == "Blue Joker" then
        chips = chips + 2*#deck
    elseif joker == "Green Joker" then
        multiplier = multiplier + (max_hands-hands) - (max_discards-discards) 
    elseif joker == "Joker" then
        multiplier = multiplier + 4
    elseif joker == "Gros Michel" then--add destroy probability at round end
        multiplier = multiplier + 15
    elseif joker == "Joker Stencil" then
        multiplier = multiplier * (5 - #jokers)
    elseif joker == "Abstract Joker" then
        multiplier = multiplier + 3*#jokers
    elseif joker == "Banner" then
        chips = chips + (discards * 30)
    end
end

function calculate_minimum_score()
    for i =1, #blind_multis do
        minimumscore[i] = ante_bases[ante] * blind_multis[i]
        if boss_num == 1 and i ==3 then
            minimumscore[3] = minimumscore[3]*2--look at later it re-runs when the boss is rerolled but only the last one needs to
        elseif boss_num == 4 and i ==3 then
            minimumscore[3] = minimumscore[3]/2
        end
        if deck_name == "Plasma" then
            minimumscore[i] = 2*minimumscore[i]
        end
    end
end

function convert_rank_to_num(rank)
    if rank == "k" or rank == "q" or rank == "j" or rank == "t" then
        return 10
    elseif rank == "a" then
        return 11
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
    repeat
        boss_num = math.random(#boss_blind)
    until boss_blind[boss_num] ~= last_boss
    last_boss = boss_blind[boss_num]
end

function get_boss_info()
    local col = boss_blind_description[boss_blind[boss_num]][1]
    local info = boss_blind_description[boss_blind[boss_num]][2]
    local boss_info_table = text_width(info,(screen_size[1]-(hud_width+10))/6)--6 is a good estimate for the average with of a character on the screen
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
    local goal = hand_size - #dealt
    while cards_added < goal and #deck >0 do
        local randomvalue = math.random(#deck)
        table.insert(dealt, deck[randomvalue])
        table.insert(dealt_enhancement,deck_enhancement[randomvalue])
        table.insert(used_cards, deck[randomvalue])
        table.remove(deck, randomvalue)
        cards_added = cards_added + 1
    end
end

function calculate_total_score(hand)
    local played = hand
    local value = 0
    local play = 0
    local face = false

    for i,v in ipairs(played) do--works feels like it shouldnt 
        for j=1, #ignore do
            if v == ignore[j] then
                table.remove(played,i)
                table.remove(hand_enhancement,i)
            end
        end
    end

    for i, v in ipairs(played) do--chips from cards and conditional jokers
        if boss_blind_debuf[boss_num] == string.sub(v,2,2) and blind == 3 then--don't count card if suit debuffed
            goto continue
        else
            if string.sub(v,1,1) == "j" or string.sub(v,1,1) == "q" or string.sub(v,1,1) == "k" then--check for face cards
                face = true
            end
            if face == true and boss_num == 8  and blind == 3 then
                goto continue
            end
            play = convert_rank_to_num(string.sub(v,1,1))--chips from card
            chips = chips + play
            played_enhancement(hand_enhancement[i])
            for j,k in ipairs(jokers) do -- doing all cards including ignored
                per_card_joker(k,v)--chips and mult from jokers 
                played_enhancement(jokers_enhancement[j])
            end
        end
        ::continue::
    end
    for i,v in ipairs(jokers) do
        final_jokers(v)
    end
    for i,v in ipairs(dealt_enhancement) do
        held_enhancement(v)
    end
    if deck_name == "Plasma" then
        local total = chips +multiplier
        chips = total/2
        multiplier = total/2
    end
    value = chips * multiplier
    return value
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
        if shop_count ==1 then
            local randomvalue = math.random(#joker_deck)
            table.insert(shop_jokers, joker_deck[randomvalue])
            table.insert(shop_jokers_enhancement,{})
        elseif shop_count == 2 then
            local randomvalue = math.random(#tarots_deck)
            table.insert(shop_jokers, tarots_deck[randomvalue])
            table.insert(shop_jokers_enhancement,{})
        elseif shop_count == 3 then
            local randomvalue = math.random(2,#planets_deck)
            table.insert(shop_jokers, planets_deck[randomvalue])
            table.insert(shop_jokers_enhancement,{})
        elseif shop_count>3 and shop_weights[shop_count]>2 then
            local randomvalue = math.random(#standard_deck)
            table.insert(shop_jokers, standard_deck[randomvalue])
            table.insert(shop_jokers_enhancement,{})
        elseif shop_count>3 and shop_weights[shop_count]==2 then
            local randomvalue = math.random(#spectral_deck)
            table.insert(shop_jokers, spectral_deck[randomvalue])
            table.insert(shop_jokers_enhancement,{})
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
    screen.drawFillRect(SCREEN_DOWN, 0, 78, screen_size[1], screen_size[2], Color.new(0, 0, 0))--press a to start background 1
    screen.drawFillRect(SCREEN_UP, 0, 192, 256, 178, Color.new(0, 0, 0))--"GAME BY LOCAL THUNK, RECREATED FOR THE DS" background
    screen.setAlpha(100)
    screen.drawFillRect(SCREEN_DOWN, 0, 50, screen_size[1], screen_size[2], Color.new256(111, 111, 111))--press a to start background 2
    screen.print(SCREEN_DOWN, screen_size[1]/2-20, screen_size[2]-10, "A: Play")
    screen.print(SCREEN_DOWN, 0, 5, "Y: Cycle Seeded")
    screen.print(SCREEN_DOWN, 0, 15, "Up/Down: Select Seed")
    screen.print(SCREEN_DOWN, 115, 5, "Left/Right: Select Deck")
    screen.print(SCREEN_DOWN, 150, 15, "X/B: Select Stake")
    screen.print(SCREEN_DOWN, 0, 65, deck_able[selected_deck].." Deck")
    local deck_text = text_width(deck_details[deck_able[selected_deck]],(screen_size[1]-(hud_width+10))/6)
    for i,v in ipairs(deck_text) do 
        screen.print(SCREEN_DOWN, hud_width+10, 65+10*(i-1), v)
    end
    screen.print(SCREEN_DOWN, 0, 120, stakes[selected_stake].." Stake")
    local stake_text = text_width(stakes_info[stakes[selected_stake]],(screen_size[1]-(hud_width+10))/6)
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
    local x_max = screen_size[1]
    local y_max = screen_size[2]
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
        local tag_details = text_width(tag_info[blind_tags[blind]],(screen_size[1]-(hud_width+10))/6)
        for i,v in ipairs(tag_details) do
            screen.print(SCREEN_UP, hud_width + 10, 70+10*(i), v) 
        end
    end
    screen.print(SCREEN_UP,hud_width+10,20 + 10*#boss_info,"Tags owned:")
    for i, v in ipairs(tag_select) do
        screen.print(SCREEN_UP,hud_width+10,20 + 10*#boss_info + 10*(i),v,Color.new(31,31,31))
    end
    screen.print(SCREEN_DOWN, screen_size[1]/3, 5, "A: Progress")
    screen.print(SCREEN_DOWN, screen_size[1]/3, 15, "X: Reroll Boss Blind ($10)")
    screen.print(SCREEN_DOWN, screen_size[1]/3, 25, "Y: SKip Blind")
end

function draw_boss_menu()
    local offset = 4
    local x = 1 --the left position of the small blind
    local x_width = 84
    local x_max = screen_size[1]
    local y_max = screen_size[2]
    local y = y_max/3
    screen.setAlpha(100)
    screen.drawFillRect(SCREEN_DOWN, 3*x + 2*x_width, y, 3*(x + x_width), y_max, boss_col)--boss blind colour big box
    screen.blit(SCREEN_DOWN, x + 4 + 2*x_width, y + 3, blind_ui)--"box behind name"
    screen.print(SCREEN_DOWN, x + 2*x_width + 6, y + 8, boss_blind[boss_num], Color.new(0, 0, 0))--name
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
    screen.drawFillRect(SCREEN_UP, 0,0,hud_width,screen_size[2],Color.new256(49,49,51))
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
    for j,k in ipairs(enhancement_type) do--works
        if k == "Gold" then
            Image.setTint(card_graphic,Color.new256(255,215,0))
        elseif k== "Steel" then
            Image.setTint(card_graphic,Color.new256(192,192,192))
        elseif k == "Glass" then
            Image.setTint(card_graphic,Color.new256(175,238,238))
        end
    end
    screen.blit(SCREEN_DOWN, x, y, card_graphic)
end

function draw_card_detail(x, y, scale, rank, suit)
    local rank_num = rank_graphics[rank]
    local suit_display = suit_graphics[suit]
    Image.scale(rank_num, math.floor(card_size[1] * scale), math.floor(card_size[2] * scale))--bad image when sorted 
    Image.scale(suit_display, math.floor(card_size[1] * scale), math.floor(card_size[2] * scale))
    screen.blit(SCREEN_DOWN, x, y, rank_num)
    screen.blit(SCREEN_DOWN, x, y, suit_display)
end

function draw_card_deck_graphic(deck, raise_selected, usage)
    local x_space = math.floor(screen_size[1]/(#deck+1))-- need #dealt+1 due to number of gaps
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
                y_pos =  screen_size[2] - 2*card_size[2] - 4*spacing--raising up to see better
                scale = 1.25
            else
                y_pos = screen_size[2] - card_size[2] - spacing
            end
        enhancement_type = dealt_enhancement
        elseif usage == "hand" then
            y_pos = screen_size[2]/2 - card_size[2]/2
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
    local x = (screen_size[1]-hud_width)/(#jokers+1)
    local y_place = screen_size[2]-card_size[2]-2
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

function draw_shop_jokers()
    local x = screen_size[1]/(3)--chosen for looks but if decide to add many jokers to shop do full width
    local y_place = screen_size[2]/2
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
    local x = 2*screen_size[1]/(3)--chosen for looks but if decide to add many jokers to shop do full width
    local y_place = screen_size[2]/2
    for i,v in ipairs(packs) do
        screen.blit(SCREEN_DOWN, x+card_size[1]*(i-1), y_place, img_packs, card_size[1]*(v[3]-1),0, card_size[1], card_size[2])--change to packs graphic
    end
end

function draw_tarots_graphics()--add art
    local x = (screen_size[1]-hud_width)/(#consumable+1)
    local y_place = screen_size[2]-2*card_size[2]-10
    for i,v in ipairs(consumable) do
        screen.drawFillRect(SCREEN_UP, hud_width + x + (i-1)*card_size[1], y_place, hud_width + x + (i)*card_size[1], y_place+card_size[2],colours[5])
    end
end

function card_details(kind)
    if kind == 1 then
        if gameplay_phase == 2 then
            if #dealt >0 then
                screen.print(SCREEN_UP,hud_width+10,50,dealt[selected_card],colours[1])
                for i,v in ipairs(dealt_enhancement[selected_card]) do--work out how to format with multiple modifiers
                    screen.print(SCREEN_UP, hud_width+10, 50+10*i, v, colours[1])
                end
            else
                screen.print(SCREEN_UP,hud_width+10,50,"No card selected",colours[1])
            end
            if #hand>0 then
                local hand_description = ""
                local x = math.floor(screen_size[1]/(#hand_enhancement+1))
                for i,v in ipairs(hand_enhancement) do
                    for j,k in ipairs(v) do
                        if j == 1 then
                            hand_description = hand_description.."{"..k..","
                        else
                            hand_description = hand_description..k..","
                        end
                        if j == #v then
                            hand_description = string.sub(hand_description,1,string.len(hand_description)-1)
                            hand_description = hand_description.."}"
                        end
                    end
                end
                screen.print(SCREEN_DOWN,(screen_size[1]-6*string.len(hand_description))/2,screen_size[2]/3,hand_description,colours[1])
            end
        elseif gameplay_phase == 4.5 then
            if #pack_cards >0 then
                local height = 50
                screen.print(SCREEN_UP,hud_width+10,height,pack_cards[selected_card],colours[1])
                screen.print(SCREEN_UP,hud_width+10,height +10,"A: add to selection",colours[1])
                screen.print(SCREEN_UP,hud_width+10,height+20,"Y: reset selection",colours[1])
                screen.setAlpha(30)
                screen.drawFillRect(SCREEN_DOWN, screen_size[1]*(selected_card)/(hand_size+1)-5,screen_size[2]/2-5,screen_size[1]*(selected_card)/(hand_size+1)+card_size[1]+5,screen_size[2]/2+card_size[2]+5,Color.new(0,0,0))--black shadow
                screen.setAlpha(100)
                for i,v in ipairs(pack_cards_enhancements[selected_card]) do
                    screen.print(SCREEN_UP, hud_width+10, height+20+10*i, v, colours[1])
                    screen.print(SCREEN_UP, hud_width+10, height+30+10*i, enhancement_info[v][1], colours[1])
                end
            else
                screen.print(SCREEN_UP,hud_width+10,50,"No card selected",colours[1])
            end
        end
    elseif kind == 1.5 and gameplay_phase==4 then
        if #shop_jokers > 0 then-- currently no additional foil polychrome etc in shop
            local x_pos = screen_size[1]/(3)--chosen for looks but if decide to add many jokers to shop do full width
            local y_pos = screen_size[2]/2
            screen.setAlpha(30)
            screen.drawFillRect(SCREEN_DOWN, x_pos+(selected_card-1)*card_size[1], y_pos, x_pos+selected_card*card_size[1],y_pos+card_size[2],Color.new(0,0,0))
            screen.setAlpha(100)
            screen.print(SCREEN_UP,hud_width+10,50,shop_jokers[selected_card]..": "..selected_card.."/"..#shop_jokers,colours[2])
            if joker_info[shop_jokers[selected_card]] ~= nil then
                local joker_info_text = text_width(joker_info[shop_jokers[selected_card]][2],(screen_size[1]-(hud_width+10))/6)
                for i,v in ipairs(joker_info_text) do
                    screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v,colours[2])
                end
                screen.print(SCREEN_UP,hud_width+10,60+10*#joker_info_text,"Buy(Y):$".. joker_info[shop_jokers[selected_card]][1],colours[2])
            elseif string.len(shop_jokers[selected_card]) == 2 then
                screen.print(SCREEN_UP,hud_width+10,50,shop_jokers[selected_card],colours[2])
                screen.print(SCREEN_UP,hud_width+10,60,"Buy(Y):$".. shop_costs[1],colours[2])
            else
                local count = 0
                repeat
                    count = count +1
                until consumable_deck[count][shop_jokers[selected_card]] ~= nil
                local info_text
                if count == 2 then
                    info_text = text_width(consumable_deck[count][shop_jokers[selected_card]][3],(screen_size[1]-(hud_width+10))/6)
                else
                    info_text = text_width(consumable_deck[count][shop_jokers[selected_card]],(screen_size[1]-(hud_width+10))/6)
                end
                for i,v in ipairs(info_text) do
                    screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v,colours[2])
                end
                screen.print(SCREEN_UP, hud_width+10,60+10*#info_text,"Buy(Y):$"..shop_costs[count+1],colours[2])
            end
        else
            screen.print(SCREEN_UP,hud_width+10,60,"No Jokers Available to Buy",colours[2])
        end
    elseif kind == 2 then
        if #jokers >0 then
            local x_pos = hud_width+(screen_size[1]-hud_width)/(#jokers+1)
            local y_pos = screen_size[2]-card_size[2]-2
            local joker_info_text = text_width(joker_info[jokers[selected_card]][2],(screen_size[1]-(hud_width+10))/6)
            screen.print(SCREEN_UP,hud_width+10,50,jokers[selected_card]..": "..selected_card.."/"..joker_size,colours[3])
            for i,v in ipairs(joker_info_text) do
                screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v,colours[3])
            end
            screen.print(SCREEN_UP,hud_width+10,60 + 10*#joker_info_text,"Sell(Y): $"..math.floor(joker_info[jokers[selected_card]][1]/2),colours[3])
            for i,v in ipairs(jokers_enhancement[selected_card]) do
                screen.print(SCREEN_UP, hud_width+10, 60 + 10*#joker_info_text+10*i, v, colours[3])
                screen.print(SCREEN_UP, hud_width+10, 70 + 10*#joker_info_text+10*i, enhancement_info[v][1], colours[3])
            end
            screen.setAlpha(30)
            screen.drawFillRect(SCREEN_UP, x_pos+(selected_card-1)*card_size[1], y_pos, x_pos+selected_card*card_size[1],y_pos+card_size[2],Color.new(0,0,0))--may make a better way
            screen.setAlpha(100)
        else
            screen.print(SCREEN_UP,hud_width+10,50,"No joker selected",colours[3])
        end
    elseif kind == 2.5 and gameplay_phase ==4 then
        if #packs > 0 then
            local x_pos = 2*screen_size[1]/(3)--chosen for looks but if decide to add many jokers to shop do full width
            local y_pos = screen_size[2]/2
            screen.print(SCREEN_UP,hud_width+10,50,packs[selected_card][1]..": "..selected_card.."/"..#packs,colours[4])--name
            local pack_text = text_width(pack_size[packs[selected_card][2]],(screen_size[1]-(hud_width+10))/6)
            for i,v in ipairs(pack_text) do
                screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v,colours[4])
            end
            screen.print(SCREEN_UP,hud_width+10,60+10*#pack_text,"Buy(Y):$"..shop_costs[5][packs[selected_card][2]],colours[4])--cost
            screen.setAlpha(30)
            screen.drawFillRect(SCREEN_DOWN, x_pos+(selected_card-1)*card_size[1], y_pos, x_pos+selected_card*card_size[1],y_pos+card_size[2],Color.new(0,0,0))
            screen.setAlpha(100)
        else
            screen.print(SCREEN_UP,hud_width+10,60,"No packs Available to Buy",colours[4])
        end
    elseif kind == 3 then
        if #consumable > 0 then
            local count= 0
            local x = (screen_size[1]-hud_width)/(#consumable+1)
            local y_place = screen_size[2]-2*card_size[2]-10
            screen.setAlpha(30)
            screen.drawFillRect(SCREEN_UP, hud_width + x + (selected_card-1)*card_size[1], y_place, hud_width + x + (selected_card)*card_size[1], y_place+card_size[2],Color.new(0,0,0))
            screen.setAlpha(100)
            repeat
                count = count +1
            until consumable_deck[count][consumable[selected_card]] ~= nil
            screen.print(SCREEN_UP,hud_width+10,50,consumable[selected_card]..": "..selected_card.."/"..consumable_size,colours[5])
            local info_text
            if count ==2 then
                info_text = text_width("Use(B):"..consumable_deck[count][consumable[selected_card]][3],(screen_size[1]-(hud_width+10))/6)
            else
                info_text = text_width("Use(B):"..consumable_deck[count][consumable[selected_card]],(screen_size[1]-(hud_width+10))/6)
            end
            for i,v in ipairs(info_text) do
                screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v,colours[5])
            end
            screen.print(SCREEN_UP, hud_width+10,60+10*#info_text,"Sell(Y):$"..math.floor(shop_costs[count+1]/2),colours[5])
        else
            screen.print(SCREEN_UP,hud_width+10,60,"No consumable Available",colours[5])
        end
    elseif kind == 3.5 and gameplay_phase == 4 then
        if #voucher_show>0 then
            screen.print(SCREEN_UP,hud_width+10,50,voucher_show[1],Color.new(31,0,0))--name
            screen.print(SCREEN_UP,hud_width+10,60,vouchers_info[voucher_show[1]],Color.new(31,0,0))--details
            screen.print(SCREEN_UP,hud_width+10,70,"Buy(Y): $"..shop_costs[6],Color.new(31,0,0))--cost
        else
            screen.print(SCREEN_UP,hud_width+10,60,"No Voucher Available",Color.new(31,0,0))
        end
    elseif kind == 4 and gameplay_phase == 4.5 then
        local buffer = 5
        local y_pack_pos = screen_size[2]/2
        screen.print(SCREEN_UP, hud_width+10, 50, pack_interior[selected_card]..": "..selected_card.."/"..cele_size)
        if name_pack == "celestial" then
            screen.print(SCREEN_UP, hud_width+10,60, planets_info[pack_interior[selected_card]][3])
        elseif name_pack == "standard" then
            for i,v in ipairs(pack_interior_enhancement[selected_card]) do--work out how to format with multiple modifiers
                screen.print(SCREEN_UP, hud_width+10, 50+10*i, v, colours[1])
                local std_text = text_width(enhancement_info[v][1],(screen_size[1]-(hud_width+10))/6)
                for j,k in ipairs(std_text) do
                    screen.print(SCREEN_UP, hud_width+10, 50+10*i+10*j, k, colours[1]) 
                end
            end
        elseif name_pack == "bufoon" then
            local joker_info_text = text_width(joker_info[pack_interior[selected_card]][2],(screen_size[1]-(hud_width+10))/6)
            for i,v in ipairs(joker_info_text) do
                screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v)
            end
        elseif name_pack == "arcana" then
            y_pack_pos = screen_size[2]-2*card_size[2]
            local tarot_info_text = text_width(tarots_info[pack_interior[selected_card]],(screen_size[1]-(hud_width+10))/6)
            for i,v in ipairs(tarot_info_text) do
                screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v)
            end
        elseif name_pack == "spectral" then
            y_pack_pos = screen_size[2]-2*card_size[2]
            local spectral_info_text = text_width(spectral_info[pack_interior[selected_card]],(screen_size[1]-(hud_width+10))/6)
            for i,v in ipairs(spectral_info_text) do
                screen.print(SCREEN_UP,hud_width+10,60+10*(i-1),v)
            end
        end
        screen.setAlpha(30)
        screen.drawFillRect(SCREEN_DOWN, screen_size[1]*(selected_card)/(cele_size+1)-buffer, y_pack_pos-buffer, screen_size[1]*(selected_card)/(cele_size+1)+card_size[1]+buffer,y_pack_pos+card_size[2]+buffer,Color.new(0,0,0))--may make a better way
        screen.setAlpha(100)
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
    local fit = screen_size[1]/4
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
    if #voucher_show >0 then
        screen.drawFillRect(SCREEN_DOWN,(screen_size[1]-card_size[1])/2,screen_size[2]-card_size[2]-30,(screen_size[1]+card_size[1])/2,screen_size[2]-30,Color.new(31,0,0))
    end
end

function movement() -- draw red background for moving card
    if kind == 1 then
        local x_pos = math.floor(screen_size[1]/(#dealt+1))
        local y_pos = screen_size[2] - card_size[2] - 5
        screen.setAlpha(30)
        screen.drawFillRect(SCREEN_DOWN, x_pos*first-card_size[1]/2, y_pos, x_pos*first+card_size[1]/2,y_pos+card_size[2],Color.new(31,0,0))
        screen.setAlpha(100)
    elseif kind == 2 then
        local x_pos = hud_width+(screen_size[1]-hud_width)/(#jokers+1)
        local y_pos = screen_size[2] - card_size[2] - 2
        screen.setAlpha(30)
        screen.drawFillRect(SCREEN_UP, x_pos+(first-1)*card_size[1], y_pos, x_pos+first*card_size[1],y_pos+card_size[2],Color.new(31,0,0))
        screen.setAlpha(100)
    end
end

function move_action(kind_type)
    if first == 0 then --dealt moving
        first = selected_card
        store_card = kind_type[first]
    else
        table.remove(kind_type,first)
        table.insert(kind_type,selected_card,store_card)
        first = 0
        store_card = ""
    end
end

function use_consumable(active,active_cards_enhancement, pack_cards,packcards_enhancement,consumable)
    local i = 0
    repeat
        i=i+1
    until consumable_deck[i][consumable[selected_card]] ~= nil
    if i == 1 then
        consumable = use_tarots(consumable)
        if #active ~= 0 and general_tarot == false then
            active, active_cards_enhancement, pack_cards, packcards_enhancement, consumable = use_target_tarots(active,active_cards_enhancement,pack_cards,packcards_enhancement,consumable)
        end
    elseif i == 2 then
        local plan_hand = planets_info[consumable[selected_card]]
        hand_multipliers[plan_hand[3]][1] = hand_multipliers[plan_hand[3]][1] + plan_hand[1]
        hand_multipliers[plan_hand[3]][2] = hand_multipliers[plan_hand[3]][2] + plan_hand[2]
        last_used_consumable = consumable[selected_card]
        table.remove(consumable,selected_card)
    elseif i == 3 then
        pack_cards, packcards_enhancement,consumable = use_spectral(pack_cards,packcards_enhancement,consumable)
        if #active ~= 0 and general_spectral == false then
            active, active_cards_enhancement, pack_cards, packcards_enhancement, consumable = use_target_spectral(active, active_cards_enhancement, pack_cards, packcards_enhancement, consumable)
        end
    end
    return active,active_cards_enhancement, pack_cards,packcards_enhancement,consumable
end

function use_tarots(tarots_select)
    general_tarot = false
    if tarots_select[selected_card] == "The Fool" and last_used_consumable ~= nil then
        table.insert(consumable, last_used_consumable)
        general_tarot = true
    elseif tarots_select[selected_card] == "The High Priestess" then
        local i = 1
        while #consumable < consumable_size+1 and i < 3 do
            local planet = planets_deck[math.random(2,#planets_deck)]
            table.insert(consumable,planet)
            i = i+1
        end
        general_tarot = true
    elseif tarots_select[selected_card] == "The Emperor" then
        local i = 1
        while #consumable<consumable_size+1 and i < 3 do--needs to be +1 as removed later
            table.insert(consumable,tarots_deck[math.random(#tarots_deck)])
            i = i+1
        end
        general_tarot = true
    elseif tarots_select[selected_card] == "The Hermit" then
        if cash > 20 then
            cash = cash + 20
        else
            cash = 2*cash
        end
        general_tarot = true
    elseif tarots_select[selected_card] == "Temperence" then
        local tot = 0
        for i,v in ipairs(jokers) do
            tot = tot + math.floor(joker_info[v][1]/2)
        end
        if tot > 50 then
            tot = 50
        end
        cash = cash + tot
        general_tarot = true
    elseif tarots_select[selected_card] == "Judgement" and #jokers<joker_size then
        table.insert(jokers,joker_deck[math.random(#joker_deck)])
        general_tarot = true
    elseif tarots_select[selected_card] == "Wheel of Fortune" then
        local index = math.random()
        local joker_index = math.random(#jokers)
        local addition = {"Foil","Holographic","Polychrome"}
        for i,v in ipairs(jokers_enhancement[selected_card]) do
            for j,k in ipairs(addition) do
                if jokers_enhancement[selected_card][i] == k then
                    table.remove(jokers_enhancement[selected_card],i)
                    break
                end
            end
        end
        if index < 0.125 then
            table.insert(jokers_enhancement[joker_index],"Foil")
        elseif index>=0.125 and index<0.2 then
            table.insert(jokers_enhancement[joker_index],"Holographic")
        elseif index>=0.2 and index<0.25 then
            table.insert(jokers_enhancement[joker_index],"Polychrome")
        end
    end
    if general_tarot == true then
        last_used_consumable = tarots_select[selected_card]
        table.remove(tarots_select,selected_card)
    end
    return tarots_select
end

function use_target_tarots(active_cards,active_cards_enhancement,stand_cards,stand_enhancement,tarots_select)
    local copy = {}
    for i,v in ipairs(active_cards) do
        table.insert(copy,i,v)
    end
    if tarots_select[selected_card] == "Death" then
        if #active_cards == 2 then
            for j,v in ipairs(full_deck) do
                if v ==active_cards[1] then
                    local same_enhance = false
                    local count= 1
                    if #full_deck_enhancement[j] == #active_cards_enhancement[1] then
                        while full_deck_enhancement[j][count] == active_cards_enhancement[1][count] and count < #full_deck_enhancement[i] do
                            if count == #active_cards_enhancement[1] then
                                full_deck[j] = active_cards[2]
                                active_cards[1] = active_cards[2]
                                active_cards_enhancement[1] = {}
                                for a,b in ipairs(active_cards_enhancement[2]) do
                                    table.insert(active_cards_enhancement[1],b)
                                end
                                break
                            end
                            count = count +1
                        end
                    end
                end
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Hanged Man" then
        if #active_cards <= 2 then
            local removal = {}
            local i = 1
            repeat
                for j,k in ipairs(copy) do 
                    if full_deck[i] == k then
                        local count= 1
                        if #full_deck_enhancement[i] == #active_cards_enhancement[j] then
                            while full_deck_enhancement[i][count] == active_cards_enhancement[j][count] and count < #full_deck_enhancement[i] do
                                if count == #active_cards_enhancement[j] then
                                    table.remove(full_deck,i)
                                    table.remove(full_deck_enhancement,i)
                                    table.insert(removal,j)
                                    table.remove(copy,j)
                                    break
                                end
                                count = count +1
                            end
                        end
                    end
                end
                i = i + 1
            until #copy < 1
            for a,b in ipairs(#removal) do
                table.remove(active_cards,b)
                table.remove(active_cards_enhancement,b)
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "Strength" then
        if #active_cards <= 2 then
            local i = 1--used for while loops dont use i for for loops here
            repeat
                for j,k in ipairs(copy) do
                    if full_deck[i]==k then
                        local count= 1
                        if #full_deck_enhancement[i] == #active_cards_enhancement[j] and count < #full_deck_enhancement[i] then
                            while full_deck_enhancement[i][count] == active_cards_enhancement[j][count] do
                                if count == #active_cards_enhancement[j] then
                                    full_deck[i] = convert_num_to_rank(position(string.sub(full_deck[i],1,1))+1)..string.sub(full_deck[i],2,2)
                                    table.remove(copy,j)
                                    break
                                end
                                count = count +1
                            end
                        end
                    end
                end
                i = i+1
            until #copy < 1
            for i,v in ipairs(active_cards) do--probably a better way
                active_cards[i] = convert_num_to_rank(position(string.sub(v,1,1))+1)..string.sub(v,2,2)
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Star" then
        if #active_cards <= 3 then
            local i = 1
            repeat
                for j,k in ipairs(copy) do
                    if full_deck[i]==k then
                        local count= 1
                        if #full_deck_enhancement[i] == #active_cards_enhancement[j] then
                            while full_deck_enhancement[i][count] == active_cards_enhancement[j][count] and count < #full_deck_enhancement[i] do
                                if count == #active_cards_enhancement[j] then
                                    full_deck[i] = string.sub(full_deck[i],1,1).."d"
                                    table.remove(copy,j)
                                    break
                                end
                                count = count +1
                            end
                        end
                    end
                 end
                 i =i+1
            until #copy <1

            for i,v in ipairs(active_cards) do
                active_cards[i] = string.sub(v,1,1).."d"
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Sun" then
        if #active_cards <= 3 then
            local i = 1--used for while loops dont use i for for loops here
            repeat
                for j,k in ipairs(copy) do
                    if full_deck[i]==k then
                        local count= 1
                        if #full_deck_enhancement[i] == #active_cards_enhancement[j] then
                            while full_deck_enhancement[i][count] == active_cards_enhancement[j][count] and count < #full_deck_enhancement[i] do
                                if count == #active_cards_enhancement[j] then
                                    full_deck[i] = string.sub(full_deck[i],1,1).."h"
                                    table.remove(copy,j)
                                    break
                                end
                                count = count +1
                            end
                        end
                    end
                 end
                 i=i+1
            until #copy < 1

            for i,v in ipairs(active_cards) do
                active_cards[i] = string.sub(v,1,1).."h"
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The World" then
        if #active_cards <= 3 then
            local i = 1--used for while loops dont use i for for loops here
            repeat
                for j,k in ipairs(copy) do
                    if full_deck[i]==k then
                        local count= 1
                        if #full_deck_enhancement[i] == #active_cards_enhancement[j] then
                            while full_deck_enhancement[i][count] == active_cards_enhancement[j][count] and count < #full_deck_enhancement[i] do
                                if count == #active_cards_enhancement[j] then
                                    full_deck[i] = string.sub(full_deck[i],1,1).."s"
                                    table.remove(copy,j)
                                    break
                                end
                                count = count +1
                            end
                        end
                    end
                 end
                 i =i+1
            until #copy < 1

            for i,v in ipairs(active_cards) do
                active_cards[i] = string.sub(v,1,1).."s"
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Moon" then
        if #active_cards <= 3 then
            local i = 1--used for while loops dont use i for for loops here
            repeat
                for j,k in ipairs(copy) do
                    if full_deck[i]==k then
                        local count= 1
                        if #full_deck_enhancement[i] == #active_cards_enhancement[j] then
                            while full_deck_enhancement[i][count] == active_cards_enhancement[j][count] and count < #full_deck_enhancement[i] do
                                if count == #active_cards_enhancement[j] then
                                    full_deck[i] = string.sub(full_deck[i],1,1).."c"
                                    table.remove(copy,j)
                                    break
                                end
                                count = count +1
                            end
                        end
                    end
                 end
                 i =i+1
            until #copy < 1

            for i,v in ipairs(active_cards) do
                active_cards[i] = string.sub(v,1,1).."c"
            end
            last_used_consumable = tarots_select[selected_card]
            table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Magician" then
        if #active_cards<3 then
            for j,k in ipairs(active_cards) do
                local i = 0
                repeat
                    local count= 1
                    i = i+1
                    if #full_deck_enhancement[i] == #active_cards_enhancement[j] then
                        local enhancement_note
                        while full_deck_enhancement[i][count] == active_cards_enhancement[j][count] and count < #full_deck_enhancement[i] do
                            if enhancement_info[full_deck_enhancement[i][count]] == "Enhancment" then
                                enhancement_note=count
                            end
                            if count == #full_deck_enhancement[i] then
                                if #enhancement_note ~= nil then
                                    table.remove(full_deck_enhancement[i],enhancement_note)
                                    table.remove(active_cards_enhancement[j],enhancement_note)
                                end
                                table.insert(full_deck_enhancement[i],"Lucky")
                                table.insert(active_cards_enhancement[j],"Lucky")
                                break
                            end
                            count = count +1
                        end
                    end
                until full_deck[i] == active_cards[j]
            end
        last_used_consumable = tarots_select[selected_card]
        table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Empress" then
        if #active_cards<3 then
            for j,k in ipairs(active_cards) do
                local i = 0
                repeat
                    local same_enhance = false
                    local count= 1
                    i = i+1
                    if #full_deck_enhancement[i] == #active_cards_enhancement[j] then
                        local enhancement_note
                        while full_deck_enhancement[i][count] == active_cards_enhancement[j][count] and count < #full_deck_enhancement[i] do
                            if enhancement_info[full_deck_enhancement[i][count]] == "Enhancment" then
                                enhancement_note = count
                            end
                            if count == #full_deck_enhancement[i] then
                                if #enhancement_note ~= nil then
                                    table.remove(full_deck_enhancement[i],enhancement_note)--should only ever be length 1
                                    table.remove(active_cards_enhancement[j],enhancement_note)
                                end
                                table.insert(full_deck_enhancement[i],"Mult")
                                table.insert(active_cards_enhancement[j],"Mult")
                            end
                            count = count +1
                        end
                    end
                until full_deck[i] == active_cards[j]
            end
        last_used_consumable = tarots_select[selected_card]
        table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Heirophant" then
        if #active_cards<3 then
            for j,k in ipairs(active_cards) do
                local i = 0
                repeat
                    local count= 1
                    i = i+1
                    if #full_deck_enhancement[i] == #active_cards_enhancement[j] then
                        local enhancement_note
                        while full_deck_enhancement[i][count] == active_cards_enhancement[j][count] and count < #full_deck_enhancement[i] do
                            if enhancement_info[full_deck_enhancement[i][count]] == "Enhancement" then
                                enhancement_note = count
                            end
                            if count == #full_deck_enhancement[i] then
                                if enhancement_note ~= nil then
                                    table.remove(full_deck_enhancement[i],enhancement_note)
                                    table.remove(active_cards_enhancement[j],enhancement_note)
                                end
                                table.insert(full_deck_enhancement[i],"Bonus")
                                table.insert(active_cards_enhancement[j],"Bonus")
                                break
                            end
                            count = count +1
                        end
                    end
                until full_deck[i] == active_cards[j]

            end
        last_used_consumable = tarots_select[selected_card]
        table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Chariot" then
        if #active_cards==1 then
            local i = 0
            repeat
                local same_enhance=false
                local count= 1
                i = i+1
                if #full_deck_enhancement[i] == #active_cards_enhancement[1] then
                    local enhancement_note
                    while full_deck_enhancement[i][count] == active_cards_enhancement[1][count] and count < #full_deck_enhancement[i] do
                        if enhancement_info[full_deck_enhancement[i][count]] == "Enhancement" then
                            enhancement_note = count
                        end
                        if count == #full_deck_enhancement[i] then
                            if enhancement_note ~= nil then
                                table.remove(full_deck_enhancement[i],enhancement_note)
                                table.remove(active_cards_enhancement[i],enhancement_note)
                            end
                            table.insert(full_deck_enhancement[i],"Steel")
                            table.insert(active_cards_enhancement[j],"Steel")
                            break
                        end
                        count = count +1
                    end
                end
            until full_deck[i] == active_cards[1]
        last_used_consumable = tarots_select[selected_card]
        table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "Justice" then
        if #active_cards==1 then
            local i = 0
            repeat
                local count= 1
                i = i+1
                if #full_deck_enhancement[i] == #active_cards_enhancement[1] then
                    local enhancement_note
                    while full_deck_enhancement[i][count] == active_cards_enhancement[1][count] and count < #full_deck_enhancement[i] do
                        if enhancement_info[full_deck_enhancement[i][count]] == "Enhancement" then
                            enhancement_note = count
                        end
                        if count == #full_deck_enhancement[i] then
                            if enhancement_note ~= nil then
                                table.remove(full_deck_enhancement[i],enhancement_note)
                                table.remove(active_cards_enhancement[i],enhancement_note)
                            end
                            table.insert(full_deck_enhancement[i],"Glass")
                            table.insert(active_cards_enhancement[j],"Glass")
                            break
                        end
                        count = count +1
                    end
                end
            until full_deck[i] == active_cards[1]
        last_used_consumable = tarots_select[selected_card]
        table.remove(tarots_select,selected_card)
        end
    elseif tarots_select[selected_card] == "The Devil" then
        if #active_cards==1 then
            local i =0
            repeat
                local count= 1
                i = i+1
                if #full_deck_enhancement[i] == #active_cards_enhancement[1] then
                    local enhancement_note
                    while full_deck_enhancement[i][count] == active_cards_enhancement[1][count] and count < #full_deck_enhancement[i] do
                        if enhancement_info[full_deck_enhancement[i][count]] == "Enhancement" then
                            enhancement_note = count
                        end
                        if count == #full_deck_enhancement[i] then
                            if enhancement_note ~= nil then
                                table.remove(full_deck_enhancement[i],enhancement_note)
                                table.remove(active_cards_enhancement[i],enhancement_note)
                            end
                            table.insert(full_deck_enhancement[i],"Gold")
                            table.insert(active_cards_enhancement[j],"Gold")
                            break
                        end
                        count = count +1
                    end
                end
            until full_deck[i] == active_cards[1]
        last_used_consumable = tarots_select[selected_card]
        table.remove(tarots_select,selected_card)
        end
    end
    for counter,v in ipairs(active_cards) do
        table.insert(stand_cards, v)
    end
    stand_cards, stand_enhancement = sort_deck(stand_cards, stand_enhancement)
    active_cards = {}
    active_cards_enhancement = {}
    chips = 0
    multiplier = 0
    hand_type = ""
    return active_cards,active_cards_enhancement,stand_cards, stand_enhancement,tarots_select
end

function use_vouchers(select)
    if select == "Overstock" then
        shop_card_size = shop_card_size + 1
        if gameplay_phase == 4 then
            add_to_shop()
        end
    elseif select == "Clearence Sale" then
        for k,v in pairs(joker_info) do
            joker_info[k][1] = math.floor(3*v[1]/4)
        end
        for i=1,4 do
            shop_costs[t] = math.floor(3*shop_costs[i]/4)
        end
        for i,v in ipairs(shop_costs[5]) do
            shop_costs[5][i] = math.floor(3*v/4)
        end
    elseif select == "Reroll Surplus" then
        min_reroll = min_reroll - 2
        reroll_price = reroll_price - 2
    elseif select == "Crystal Ball" then
        consumable_size = consumable_size + 1
    elseif select == "Grabber" then
        max_hands = max_hands + 1
    elseif select == "Wasteful" then
        max_discards = max_discards +1
    elseif select == "Seed Money" then
        max_interest = 10
    elseif select == "Heiroglyph" then
        ante = ante - 1
        max_hand_size = max_hand_size -1
    elseif select == "Director's Cut" then
        boss_reroll = true
    elseif select == "Paint Brush" then
        max_hand_size = max_hand_size +1
    elseif select == "Tarot Merchant" then
        shop_weights[2] = 2*shop_weights[2]
    elseif select == "Planet Merchant" then
        shop_weights[3] = 2*shop_weights[3]
    elseif select == "Telescope" then
        telescope = true
    elseif select == "Magic Trick" then
        table.insert(shop_weights,shop_locked_weights[1])
    end
    for i,v in ipairs(vouchers) do
        if v == select then
        table.remove(vouchers,i)
        end
    end
end

function use_spectral(stand_cards, stand_cards_enhancement, spectral_select)
    general_spectral = false
    if spectral_select[selected_card] == "Soul" then--indexing issue
        if #jokers < max_jokers then
            table.insert(jokers, jokers_legendary[math.random(#jokers_legendary)])
        end
        general_spectral = true
    elseif spectral_select[selected_card] == "Black Hole" then
        for i = 2, #planets_deck do
            local plan_hand = planets_info[i][3]
            hand_multipliers[plan_hand][1] = hand_multipliers[plan_hand][1] + planets_info[i][1]
            hand_multipliers[plan_hand][2] = hand_multipliers[plan_hand][2] + planets_info[i][2]
        end
        general_spectral = true
    elseif spectral_select[selected_card] == "Sigil" then
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
        general_spectral = true
    elseif spectral_select[selected_card] == "Ouija" then
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
                    full_deck[i] = string.sub(standard_deck[index],1,1)..sting.sub(v,2,2)
                    table.remove(copy,i)
                end
            end
        until #copy == 0
        for i,v in ipairs(stand_cards) do
            stand_cards[i] = string.sub(standard_deck[index],1,1)..sting.sub(v,2,2)
        end
        max_hand_size = max_hand_size-1
        general_spectral = true
    elseif spectral_select[selected_card] == "Immolate" then
        local card_destroy = {}
        local card_destroy_enhancement = {}
        for i=1,5 do
            local index = math.random(#stand_cards)
            table.insert(card_destroy,stand_cards[index])
            table.insert(card_destroy_enhancement,stand_cards_enhancement[index])
            table.remove(stand_cards,index)
            table.remove(stand_cards_enhancement,index)
        end
        local start = #full_deck
        local counter = 1
        while start ~= #full_deck+#card_destroy do
            for j, k in ipairs(card_destroy) do
                if full_deck[counter] == k then
                    local enchant_index = 0
                    for a,b in ipairs(full_deck_enhancement[counter]) do
                        if full_deck_enhancement[counter][a] == card_destroy_enhancement[j][a] then
                        enchant_index = enchant_index+1 
                        end
                    end
                    if enchant_index == #full_deck_enhancement[counter] then
                        table.remove(full_deck,counter) 
                        table.remove(full_deck_enhancement,counter)
                    end
                end
            end
            counter = counter + 1
        end
        cash = cash + 20
        general_spectral = true
    elseif spectral_select[selected_card] == "Ankh" then
        local index = math.random(#jokers)
        local copy = {jokers[index],jokers[index]}
        jokers = {}
        for i,v in ipairs(copy) do
            table.insert(jokers,v)
        end
        general_spectral = true
    elseif spectral_select[selected_card] == "Familiar" then
        local index = math.random(#stand_cards)
        table.remove(stand_cards,index)
        table.remove(stand_cards_enhancement,index)
        for i=1, 3 do
            repeat
                local index2 = math.random(#standard_deck)
                local value = standard_deck[index2]
            until string.sub(value,1,1) == "k" or string.sub(value,1,1) == "q" or string.sub(value,1,1) == "j"
        table.insert(stand_cards,standard_deck[index2])
        local addition = get_random_enhance()
        table.insert(stand_cards_enhancement,{addition})
        end
    elseif spectral_select[selected_card] == "Grim" then
        local index = math.random(#stand_cards)
        table.remove(stand_cards,index)
        table.remove(stand_cards_enhancement,index)
        for i=1, 2 do
            repeat
                local index2 = math.random(#standard_deck)
                local value = standard_deck[index2]
            until string.sub(value,1,1) == "a"
        table.insert(stand_cards,standard_deck[index2])
        local addition = get_random_enhance()
        table.insert(stand_cards_enhancement,{addition})
        end
    elseif spectral_select[selected_card] == "Incantation" then
        local index = math.random(#stand_cards)
        table.remove(stand_cards,index)
        table.remove(stand_cards_enhancement,index)
        for i=1, 4 do
            repeat
                local index2 = math.random(#standard_deck)
                local value = standard_deck[index2]
            until tonumber(string.sub(value,1,1)) ~= nil
        table.insert(stand_cards,standard_deck[index2])
        local addition = get_random_enhance()
        table.insert(stand_cards_enhancement,{addition})
        end
    elseif spectral_select[selected_card] == "Hex" then
        if #jokers >0 then
            local index = math.random(#jokers)
            local copy = {jokers[index]}
            jokers = {}
            jokers_enhancement= {}
            table.insert(jokers_enhancement, {"Polychrome"})
            table.insert(jokers,copy[1])
            general_spectral = true
        end
    end
    if general_spectral == true then
        table.remove(spectral_select,selected_card)
    end
    return stand_cards, stand_cards_enhancement, spectral_select
end

function use_target_spectral(active_cards,active_cards_enhancement,stand_cards,stand_enhancement,spectral_select)
    if spectral_select[selected_card] == "Cryptid" then
        if #active == 1 then
            for i =1 ,2 do
                table.insert(full_deck,active_cards[1])
                tabl.insert(full_deck_enhancement,active_cards[1])
                if gameplay_phase == 1 then
                    table.insert(stand_cards,active_cards[1])
                    table.insert(stand_cards_enhancement,active_cards[1])
                end
            end
            table.remove(spectral_select,selected_card)
        end
    elseif spectral_select[selected_card] == "Aura" then
        if #active == 1 then
            local index = math.random(3)
            local addition = {"Foil","Holographic","Polychrome"}
            for i,v in ipairs(active_cards_enhancement[selected_card]) do
                for j,k in ipairs(addition) do
                    if active_cards_enhancement[selected_card][i] == k then
                        table.remove(active_cards_enhancement[selected_card],i)
                        break
                    end
                end
            end
            table.insert(active_cards_enhancement[selected_card],addition[index])
            table.remove(spectral_select,selected_card)
        end
    elseif spectral_select[selected_card] == "Trance" then
        if #active_cards == 1 then
            for i,v in ipairs(active_cards_enhancement[selected_card]) do
                for j,k in ipairs(seals) do
                    if active_cards_enhancement[selected_card][i] == k then
                        table.remove(active_cards_enhancement[selected_card],i)
                        break
                    end
                end
            end
            table.insert(active_cards_enhancement[selected_card],"Blue Seal")
            table.remove(spectral_select,selected_card)
        end
    end
end

function open_pack()
    pack_count_now = 0
    kind = 4
    gameplay_phase = 4.5
    pack_interior = {}
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
                if t[3] > hand_multipliers[max_hand][3] then--nil value
                    max_hand = k
                end
            end
            for k, v in pairs(planets_info) do
                if v==max_hand then
                    max_planet = k
                end
            end
            table.insert(pack_interior,max_planet)
        end
        for i=#pack_interior+1, cele_size do
            local rand_blackhole = math.random()
            if rand_blackhole < 0.003 then
                table.insert(pack_interior,"Black Hole")
            else
                local index = math.random(2,#planets_deck)
                table.insert(pack_interior,planets_deck[index])
                table.remove(planets_deck,index)
            end
        end
        reset_planets()
    elseif name_pack == "standard" then
        pack_interior_enhancement = {}
        for i = 1, cele_size do
            local addition = get_random_enhance()
            table.insert(pack_interior_enhancement,{addition})
            local index = math.random(#standard_deck)
            table.insert(pack_interior,standard_deck[index])
        end
    elseif name_pack == "bufoon" then
        for i = 1, cele_size do
            local index = math.random(#joker_deck)
            table.insert(pack_interior,joker_deck[index])
        end
    elseif name_pack == "arcana" then--add probability of soul card
        pack_cards = {}
        pack_cards_enhancements = {}
        active = {}
        active_enhancement = {}
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
        end
    elseif name_pack == "spectral" then
        pack_cards = {}
        pack_cards_enhancements = {}
        active = {}
        active_enhancement = {}
        for i =1, hand_size do
            local index = math.random(#copy)
            table.insert(pack_cards,copy[index])
            table.insert(pack_cards_enhancements,copy_enhancement[i])
            table.remove(copy,index)
        end
        for i =1, cele_size do
            local rand_blackhole = math.random()
            if rand_blackhole < 0.003 then
                table.insert(pack_interior,"Black Hole")
            else
                local index = math.random(#spectral_deck)
                table.insert(pack_interior,spectral_deck[index])
                table.remove(copy,index)
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
        elseif v == "Orbital" then
            for k, t in pairs(planets_info) do
                local index = string.find(tag_info[v],t[3])
                if index ~= nil then
                    local plan_hand = t[3]
                    local planet = planets_info[k]
                    break
                end
            end
            for i = 1, 3 do
                hand_multipliers[plan_hand][1] = hand_multipliers[plan_hand][1] + planet[1]
                hand_multipliers[plan_hand][2] = hand_multipliers[plan_hand][2] + planet[2] 
            end
            table.remove(tag_select,i)
            i=i-1
        end
    end
end

function tag_shop()
    for i,v in ipairs(tag_select) do
        if v == "D6" then
            reroll_price = 0
            table.remove(tag_select,i)
        elseif v == "Voucher" and vouchers_show == 0 then
            table.insert(voucher_show,vouchers[math.random(#vouchers)])
            table.remove(tag_select,i)
        elseif v == "uncommon" then
            table.insert(shop_jokers,joker_deck[math.random(#joker_deck)])
            table.remove(tag_select,i)
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
        elseif v == "Gold Seal" then
            cash = cash + 3
        elseif v == "Red Seal" then
            --retrigger once
        end
    end
end

function held_enhancement(card_enhanced)
    for i,v in ipairs(card_enhanced) do
        if v == "Steel" then
            multiplier = multiplier*1.5
        end 
    end
end

function round_end_enhancement()
    for j,k in ipairs(dealt_enhancement) do
        for i,v in ipairs(k) do
            if v == "Gold" then
                cash = cash + 3
            elseif v == "Blue Seal" then
                local plan_type = ""
                if #consumable<consumable_size then
                    for k,v in pairs(planets_info)do
                        if v[3] == hand_type then
                            plan_type = k
                            break
                        end
                    end
                    table.insert(consumable,plan_type)
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
        screen.drawFillRect(SCREEN_UP, 0, 0, screen_size[1], screen_size[2], Color.new256(0, 153, 76))--green backgorund
        screen.drawFillRect(SCREEN_DOWN, 0, 0, screen_size[1], screen_size[2], Color.new256(0, 153, 76))
        phase_2_update()
        if gameplay_phase ~= 2.5 then--not drawing joker and tarot on pause menu for clarity
            draw_joker_card_graphic()
            draw_tarots_graphics()
        end
        if gameplay_phase == 0 then--initialise for first blind
            for i =1, 2 do
                local tag_num = math.random(#tag_deck)
                table.insert(blind_tags,tag_deck[tag_num])
            end
            set_boss_blind()
            calculate_minimum_score()
            boss_col, boss_info = get_boss_info()
            gameplay_phase = 1
        elseif gameplay_phase == 1 then--chossing blind
            draw_blind_menu()
            draw_boss_menu()
            if Keys.newPress.X and cash > 10 and boss_reroll==true then
                set_boss_blind()
                calculate_minimum_score()
                boss_col, boss_info = get_boss_info()
                cash = cash - 10
            end

            if Keys.newPress.A then
                gameplay_phase = 2
                if boss_num == 4 and blind == 3 then
                    hands = 1
                elseif boss_num == 6 and blind == 3 then
                    hand_size = hand_size - 1
                end
                last_played_hand = ""
                add_to_dealt()
                dealt,dealt_enhancement = sort_deck(dealt,dealt_enhancement)
            end

            if Keys.newPress.Y then
                if blind < 3 then
                    table.insert(tag_select,blind_tags[blind])
                    blind = blind + 1
                    tag_immediate()
                end
            end
            if Keys.newPress.Start then--game menu to look at deck/volume etc
                prev_phase = gameplay_phase
                index_menu = 1
                gameplay_phase = 2.5
            end

        elseif gameplay_phase == 2 then--choosing hand
            draw_card_deck_graphic(dealt, selected_card, "dealt")
            draw_card_base_graphic((screen_size[1]-card_size[1])/2,0,1,{})--card for deck
            screen.print(SCREEN_DOWN, (screen_size[1]-card_size[1])/2+2, 7,#deck, Color.new(0,0,0))
            if #hand ~= 0 then
                draw_card_deck_graphic(hand, selected_card, "hand")
            end

            if first ~= 0 then
                movement()
            end

            if kind == 1 then
                selected_card = bounds(dealt,selected_card)
            elseif kind == 2 then
                selected_card = bounds(jokers,selected_card)
            elseif kind == 3 then
                selected_card = bounds(consumable,selected_card)
            end

            card_details(kind)

            if Keys.newPress.Start then--game menu to look at deck volume etc
                gameplay_phase = 2
                index_menu = 1
                prev_phase = 2
            end

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
                    move_action(dealt)
                elseif kind == 2 then
                    move_action(jokers)
                elseif kind == 3 then
                    hand,hand_enhancement, dealt,dealt_enhancement,consumable = use_consumable(hand,hand_enhancement, dealt,dealt_enhancement,consumable)
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
                for i,v in ipairs(hand) do
                    table.insert(dealt, v)
                    table.insert(dealt_enhancement, hand_enhancement[i])
                end
                dealt,dealt_enhancement = sort_deck(dealt,dealt_enhancement)
                hand = {}
                hand_enhancement = {}
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
                hand = {}
                hand_enhancement = {}
                add_to_dealt()
                dealt,dealt_enhancement = sort_deck(dealt,dealt_enhancement)
                discards = discards - 1
                elseif kind == 2 then
                    cash = cash + math.floor(joker_info[jokers[selected_card]][1]/2)
                    table.remove(jokers, selected_card)
                elseif kind == 3 then
                    local i = 1
                    repeat
                        i=i+1
                    until consumable_deck[i][consumable[selected_card]] ~= nil
                    cash = cash + math.floor(shop_costs[1+i]/2)
                    table.remove(consumable, selected_card)
                end
            end
            if blind == 3 then
                if boss_num == 7 and last_played_hand ~= hand_type and hands < 4 then--will need to keep an eye on if new decks added with more or fewer hands
                    can_play_hand = false
                elseif boss_num == 2 and #hand ~= 5 then
                    can_play_hand = false
                end
            end
            if Keys.newPress.A then
                if can_play_hand and kind == 1 then
                    if boss_num == 3 and blind == 3 then--some boss_blind stuff
                        for i=1, 2 do
                            table.remove(dealt, math.random(#dealt))--discard 2 cards
                        end
                    elseif boss_num == 5 and blind == 3 then
                        cash = cash - 1
                    end
                    for k,v in pairs(locked_planets) do
                        if locked_planets[last_played_hand] ~= nil then
                            table.insert(full_planets,v)
                            table.insert(planets_deck,v)
                            locked_planets[k] = nil
                        end
                    end
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
                index_menu = 1
                gameplay_phase = 2.5
            end
        elseif gameplay_phase == 2.5 then--game menu
            local index_menu_details = {"Show Deck","Show Hand Types","Show Enhancments", "Adjust Volume", "Retire Run"}
            screen.print(SCREEN_UP, screen_size[1]/2 -5,screen_size[2]/3,"Main Menu",Color.new(0,0,0))
            for i,v in ipairs(index_menu_details) do
                screen.print(SCREEN_UP, screen_size[1]/2 -5,screen_size[2]/3+10*(i),v,Color.new(31,31,31))
            end
            index_menu = bounds(index_menu_details,index_menu)
            screen.drawFillRect(SCREEN_UP, screen_size[1]/2 - 15, screen_size[2]/3+10*index_menu, screen_size[1]/2 - 6, screen_size[2]/3+10*(index_menu)+7, Color.new(0, 0, 0))
            if index_menu_details[index_menu] == "Show Deck" then
                for i,v in ipairs(deck) do--cards in deck
                    if string.sub(v,2,2) == "h" then
                        deck_y = screen_size[2]/5
                    elseif string.sub(v,2,2) == "d" then
                        deck_y = 2*screen_size[2]/5
                    elseif string.sub(v,2,2) == "s" then
                        deck_y = 3*screen_size[2]/5
                    elseif string.sub(v,2,2) == "c" then
                        deck_y = 4*screen_size[2]/5
                    end
                screen.print(SCREEN_DOWN, 20 + 13*position(string.sub(v,1,1)), deck_y, v)-- works now but not when added cards, random issue 3/4/25 nil value arithmetic
                end
                for i,v in ipairs(used_cards)do--cards used or in dealt
                    if string.sub(v,2,2) == "h" then
                        deck_y = screen_size[2]/5
                    elseif string.sub(v,2,2) == "d" then
                        deck_y = 2*screen_size[2]/5
                    elseif string.sub(v,2,2) == "s" then
                        deck_y = 3*screen_size[2]/5
                    else
                        deck_y = 4*screen_size[2]/5
                    end
                    screen.print(SCREEN_DOWN, 20 + 13*position(string.sub(v,1,1)), deck_y, v, Color.new(31,0,0))-- works now but not when added cards
                end
            elseif index_menu_details[index_menu] == "Show Hand Types" then
                local i = 1
                for k,v in pairs(hand_multipliers) do
                    if k == "" then
                        goto continue
                    end
                    screen.print(SCREEN_DOWN, screen_size[1]/3, 10*i, k)
                    screen.print(SCREEN_DOWN, 2*screen_size[1]/3, 10*i, v[1],Color.new(0,0,31))
                    screen.print(SCREEN_DOWN, 2*screen_size[1]/3+20, 10*i, v[2],Color.new(31,0,0))
                    i = i +1
                    ::continue::
                end
            elseif index_menu_details[index_menu] == "Show Enhancments" then
                local i = 0
                for k,v in pairs(enhancement_info)do
                    screen.print(SCREEN_DOWN,5,10+i,k..":")
                    local width = screen_size[1]/6-(string.len(k)+2)
                    local v = text_width(v[1],width)
                    for j=1, #v do
                        screen.print(SCREEN_DOWN,6*(string.len(k)+2),10*j+i,v[j]) 
                    end
                    i = i+#v*10
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
                screen.print(SCREEN_DOWN, screen_size[1]/3, screen_size[2]/2, "Music")
                screen.print(SCREEN_DOWN, screen_size[1]/3, screen_size[2]/2+10, MOD_volume*100)
                screen.print(SCREEN_DOWN, 2*screen_size[1]/3, screen_size[2]/2, "SFX")
                screen.print(SCREEN_DOWN, 2*screen_size[1]/3, screen_size[2]/2+10, SFX_volume*100)
            elseif index_menu_details[index_menu] == "Retire Run"  then
                screen.print(SCREEN_DOWN, 70, screen_size[2]/2, "Hold A to retire run")
                if Keys.held.A then
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
            val = calculate_total_score(hand)--move this to gameplay_phase 3 
            round_score = round_score + val
            hand = {}
            hand_enhancement = {}
            if hands == 0 and round_score < minimumscore[blind] then
                lose()
            elseif round_score >= minimumscore[blind] then
                round_end_enhancement()
                gameplay_phase = 3.5
                interest = math.Clamp(math.floor(cash / 5), 0, max_interest)
                cash_out = blind_payouts[blind] + hands*hand_cash + discards*discard_cash + interest
                shop_jokers = {}
                if blind == 3 and deck_name == "Anaglyph" then
                    table.insert(tag_select,"Double")
                end
            else
                gameplay_phase = 2
                add_to_dealt()
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
                if blind == 1 then
                    voucher_show = {}
                    if ante == 1 then
                        repeat
                            table.remove(voucher_show,1)
                            table.insert(voucher_show, vouchers[math.random(#vouchers)])
                        until voucher_show[1] ~= "Heiroglyph" --heiroglyph not possible on ante 1
                    else
                        table.insert(voucher_show, vouchers[math.random(#vouchers)])
                    end
                end
                tag_shop()
                kind = 1.5
                selected_card = 1
                add_to_shop()
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
            if first ~= 0 then
                movement()
            end
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
                        if #shop_jokers > 0 and #jokers < joker_size and cash >= joker_info[shop_jokers[selected_card]][1] then
                            cash = cash - joker_info[shop_jokers[selected_card]][1]
                            table.insert(jokers, shop_jokers[selected_card])
                            table.insert(jokers_enhancement,shop_jokers_enhancement[selected_card])
                            table.remove(shop_jokers, selected_card)
                            selected_card = 1
                        end
                    elseif string.len(shop_jokers[selected_card]) == 2 then--may be a better way, works for now
                        if cash >= shop_costs[1] then
                            cash = cash - shop_costs[1]
                            table.insert(full_deck, shop_jokers[selected_card])
                            table.remove(shop_jokers, selected_card)
                            selected_card = 1
                            reset_deck()
                        end
                    else
                        local i = 0
                        repeat
                            i=i+1
                        until consumable_deck[i][shop_jokers[selected_card]] ~= nil
                        if cash >= shop_costs[1+i] and #consumable<consumable_size then--issue with the 2nd consumable picked
                            cash = cash - math.floor(shop_costs[1+i])
                            table.insert(consumable,shop_jokers[selected_card])
                            table.remove(shop_jokers, selected_card)
                        end
                    end
                elseif kind == 2 then--joker
                    cash = cash + math.floor(joker_info[jokers[selected_card]][1]/2)
                    table.remove(jokers, selected_card)
                elseif kind == 2.5 then--packs
                    name_pack = packs[selected_card][1]
                    type_pack = packs[selected_card][2]
                    if cash >= shop_costs[5][type_pack] and #packs > 0  then
                        cash = cash - shop_costs[5][type_pack]
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
                        open_pack()
                    end
                elseif kind == 3 then--consumable
                    local i = 1
                    repeat
                        i=i+1
                    until consumable_deck[i][consumable[selected_card]] ~= nil
                    cash = cash + math.floor(shop_costs[1+i]/2)
                    table.remove(consumable, selected_card)
                elseif kind == 3.5 then--voucher
                    if cash >= shop_costs[#shop_costs] then
                        cash = cash - shop_costs[#shop_costs]
                        use_vouchers(voucher_show[selected_card])
                        table.remove(voucher_show,selected_card)
                        kind = 1.5
                    end
                end
            end

            if Keys.newPress.B then
                if kind == 2 then
                    move_action(jokers)
                elseif kind == 3 then
                    local active_gameplay4 = {}
                    local active_gameplay4_enhancement = {}
                    local pack_cards_enhancements ={}
                    active_gameplay4,active_gameplay4_enhancement, pack_cards,pack_cards_enhancements,consumable = use_consumable(active_gameplay4,active_gameplay4_enhancement, pack_cards,pack_cards_enhancements,consumable)
                end
            end

            if Keys.newPress.X and cash >= reroll_price then
                cash = cash - reroll_price
                reroll_price = reroll_price + 1
                shop_jokers = {}
                add_to_shop()
            end

            if Keys.newPress.A then
                kind = 1
                round = round +1
                if blind == 3 then
                    blind = 1
                    ante = ante +1
                    if ante == 2 then
                        for i,v in ipairs(tag_unlock_2) do
                            table.insert(tag_deck,v)
                        end
                        tag_unlock_2 = {}
                    end
                    blind_tags = {}
                    for i =1, 2 do
                        local tag_num = math.random(#tag_deck)
                        if tag_deck[tag_num] == "Orbital" then
                            local index = math.random(2,#planets_deck)
                            local plan_hand = planets_info[planets_deck[index]][3]
                            tag_info[tag_deck[tag_num]] = tag_info[tag_deck[tag_num]]..plan_hand
                        end
                        table.insert(blind_tags,tag_deck[tag_num])
                    end
                    set_boss_blind()--not refreshing signage
                    boss_col, boss_info = get_boss_info()
                    calculate_minimum_score()
                else
                    blind = blind + 1
                end
                soft_reset()
                gameplay_phase = 1
            end

            if Keys.newPress.Start then--game menu to look at deck volume etc
                prev_phase = gameplay_phase
                gameplay_phase = 2.5
                index_menu = 1
            end
        elseif gameplay_phase == 4.5 then--packs
            screen.print(SCREEN_DOWN,screen_size[1]/3,screen_size[2]-card_size[2]/2,"X: Skip")
            screen.print(SCREEN_DOWN,2*screen_size[1]/3,screen_size[2]-card_size[2]/2,"B: Use")
            local pack_count_tot = 1--number of cards to pick
            if type_pack == 3 then
                pack_count_tot = 2
            end
            screen.print(SCREEN_DOWN,screen_size[1]/3,card_size[2],"Choose "..pack_count_tot-pack_count_now)
            local y_pack_pos
            if name_pack == "arcana" or name_pack == "spectral" then
                y_pack_pos= screen_size[2]-2*card_size[2]
                if kind > 4 then
                    kind =1
                elseif kind <1 then
                    kind = 4
                end
            else
                y_pack_pos = screen_size[2]/2
                if kind > 4 then
                    kind =2
                elseif kind <2 then
                    kind = 4
                end
            end

            if name_pack == "celestial" then
                for i = 1, #pack_interior do
                    screen.print(SCREEN_DOWN, screen_size[1]*(i)/(cele_size+1),y_pack_pos,pack_interior[i])
                end
            elseif name_pack == "standard" then
                for i,v in ipairs(pack_interior) do
                    local rank_c = string.sub(v,1,1)
                    local suit_c = string.sub(v,2,2)
                    draw_card_base_graphic(screen_size[1]*(i)/(cele_size+1),y_pack_pos,1,pack_interior_enhancement[i])
                    draw_card_detail(screen_size[1]*(i)/(cele_size+1),y_pack_pos,1,rank_c,suit_c)
                end
            elseif name_pack == "bufoon" then
                local joke_index = 0
                for i,v in ipairs(pack_interior) do
                    joke_index = joker_info[v][3]
                    screen.blit(SCREEN_DOWN, screen_size[1]*(i)/(cele_size+1),y_pack_pos, joker_graphics, card_size[1]*(joke_index-1),0, card_size[1], card_size[2])
                end
            elseif name_pack == "arcana" then
                for i,v in ipairs(active) do
                    local rank_c = string.sub(v,1,1)
                    local suit_c = string.sub(v,2,2)
                    draw_card_base_graphic(screen_size[1]*(i)/(hand_size+1),screen_size[2]/3,1,active_enhancement[i])
                    draw_card_detail(screen_size[1]*(i)/(hand_size+1),screen_size[2]/3,1,rank_c,suit_c)
                end
                for i,v in ipairs(pack_cards) do
                    local rank_c = string.sub(v,1,1)
                    local suit_c = string.sub(v,2,2)
                    draw_card_base_graphic(screen_size[1]*(i)/(hand_size+1),screen_size[2]/2,1,pack_cards_enhancements[i])
                    draw_card_detail(screen_size[1]*(i)/(hand_size+1),screen_size[2]/2,1,rank_c,suit_c)
                end
                for i,v in ipairs(pack_interior) do
                    screen.drawFillRect(SCREEN_DOWN, screen_size[1]*(i)/(cele_size+1),y_pack_pos, screen_size[1]*(i)/(cele_size+1)+card_size[1],y_pack_pos+card_size[2],colours[5])
                end
            elseif name_pack == "spectral" then
                for i,v in ipairs(active) do
                    local rank_c = string.sub(v,1,1)
                    local suit_c = string.sub(v,2,2)
                    draw_card_base_graphic(screen_size[1]*(i)/(hand_size+1),screen_size[2]/3,1,active_enhancement[i])
                    draw_card_detail(screen_size[1]*(i)/(hand_size+1),screen_size[2]/3,1,rank_c,suit_c)
                end
                for i,v in ipairs(pack_cards) do
                    local rank_c = string.sub(v,1,1)
                    local suit_c = string.sub(v,2,2)
                    draw_card_base_graphic(screen_size[1]*(i)/(hand_size+1),screen_size[2]/2,1,pack_cards_enhancements[i])
                    draw_card_detail(screen_size[1]*(i)/(hand_size+1),screen_size[2]/2,1,rank_c,suit_c)
                end
                for i,v in ipairs(pack_interior) do
                    screen.drawFillRect(SCREEN_DOWN, screen_size[1]*(i)/(cele_size+1),y_pack_pos, screen_size[1]*(i)/(cele_size+1)+card_size[1],y_pack_pos+card_size[2],Color.new(0,0,31))
                end
            end
            if kind == 4 then
                if Keys.newPress.B then
                    local initial_len = #pack_interior
                    if name_pack == "celestial" then
                        if pack_interior[selected_card] ~= "Black Hole" then
                            local plan_hand = planets_info[pack_interior[selected_card]]
                            hand_multipliers[plan_hand[3]][1] = hand_multipliers[plan_hand[3]][1] + plan_hand[1]
                            hand_multipliers[plan_hand[3]][2] = hand_multipliers[plan_hand[3]][2] + plan_hand[2]
                            last_used_consumable = pack_interior[selected_card]
                        else
                            use_spectral({},pack_interior)
                        end
                        table.remove(pack_interior,selected_card)
                    elseif name_pack == "standard" then
                        table.insert(full_deck, pack_interior[selected_card])
                        table.insert(full_deck_enhancement, pack_interior_enhancement[selected_card])
                        table.remove(pack_interior,selected_card)
                    elseif name_pack == "bufoon" and #jokers < joker_size then
                        table.insert(jokers, pack_interior[selected_card])
                        table.insert(jokers_enhancement,{})
                        table.remove(pack_interior,selected_card)
                    elseif name_pack == "arcana" then
                        pack_interior  = use_tarots(pack_interior)
                        if #active ~= 0 and general_tarot == false then
                            active, active_enhancement, pack_cards, pack_cards_enhancements,pack_interior = use_target_tarots(active,active_enhancement,pack_cards,pack_cards_enhancements,pack_interior)
                        end
                    elseif name_pack == "spectral" then
                        pack_cards, pack_interior = use_spectral(pack_cards, pack_interior)
                        if #active ~= 0 and general_spectral == false then
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
                    cash = cash + math.floor(joker_info[jokers[selected_card]][1]/2)
                    table.remove(jokers, selected_card)
                end
                if Keys.newPress.B then
                    move_action(jokers)
                end
                selected_card = bounds(jokers,selected_card)
            elseif kind == 3 then
                if Keys.newPress.B then
                    active,active_enhancement, pack_cards,pack_cards_enhancements,consumable = use_consumable(active,active_enhancement, pack_cards,pack_cards_enhancements,pack_interior)
                elseif Keys.newPress.Y then
                    local i = 1
                    repeat
                        i=i+1
                    until consumable_deck[i][consumable[selected_card]] ~= nil
                    cash = cash + math.floor(shop_costs[1+i]/2)
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
                gameplay_phase = prev_phase
                selected_card = 1
                reset_deck()
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
--Image.destroy(card_shadow_graphic)
Image.destroy(card_graphic)