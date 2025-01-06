import random
# need one for true trance, for future garage... solely for chiptune?
# solely for cinematic?

paradigmnArr = ["jazz", "Electro Swing", "synthwave_or_eighties", "trap"]

jazzStyles = ["jazz", "brass band, jazz", "blues, jazz", "orchestra, jazz", "easy listening", "nu disco, jazz",
              "lounge", "lounge, jazz", "soft rock, jazz", "deep house, jazz", "deep house, lounge"]
jazzInstruments = ["minimal precussion", "bongos", "clarinet", "violin", "saxophone", "trombone", "double bass", "cello", "piano"]
jazzMoodArr = ["deep house", "horror", "anime", "anime soundtrack", "sad", "thriller", "dystopian", "suspense", "sophistocated", "mysterious", "dreamy", "atmospheric", "downtempo"]
# -- NOTE: -- DataArr = [style, instrument, mood] ! Order is important for indexes used by the get sub arr items fnction later on!
jazzDataArr = [jazzStyles, jazzInstruments, jazzMoodArr]

electroSwingStyles = ["electro swing", "nu disco", "dark cabaret", "swing, electronic", "electro swing, trance",
                    "electro swing, edm"]
electroSwingInstruments = ["turntables", "synth precussion", "bongos", "tambourine", "clarinet", "brass band", "orchestra", "violin", "synthesizer", "keyboard", "electric guitar", "turntables", "saxophone", "trombone", "trumpet", "double bass", "cello", "piano"]
electroSwingMoodArr = ["brass stabs", "minimal", "lo-fi", "anime", "upbeat", "bluesy", "energetic", "hopeful", "sad", "melancholy", "dark", "oldies"]
electroSwingDataArr = [electroSwingStyles, electroSwingInstruments, electroSwingMoodArr]

eightiesStyles = ["80s pop", "80s rock", "synthwave", "cyberpunk", "synthwave, retro game music", 
                  "darksynth", "industrial rock", "chiptune", "chiptune, retro game music"]
eightiesInstrumets = ["synthesizer", "darksynth", "drum machine", "808 drum kit", "electric bass", "electric guitar", "vocoder", "square wave", "heavy drum kicks"]
eightiesMoodArr = ["distorted synth", "dark", "sad", "harmonic chords", "downtempo", "nostalgic", "reflective", "aggressive", "dystopian", "suspense", "atmospheric", "dreamy"]
eightiesDataArr = [eightiesStyles, eightiesInstrumets, eightiesMoodArr]

trapStyles = ["witch house", "witch house, trap house", "R&B, trap", "acid dubstep, trap", "hip hop", "hip hop, bounce",
            "witch house, hip hop", "rap, witch house", "hip hop, phonk", "phonk, witch house", "deep house, phonk", "progressive house, phonk"]
trapInstruments = ["kick drum", "808 bass", "orchestral", "brass", "brass orchestra", "snare drum", "hi-hats", "sampler", "bass guitar", "synth bass", "heavy bass"]
trapMoodArr = ["distorted synth", "distorted beats", "aggressive", "dark", "reflective", "downtempo", "relaxing", "heavy", "bass boosted", "epic", "hopeful"]
trapDataArr = [trapStyles, trapInstruments, trapMoodArr]
# ...
techniqueArr = ["layered bass", "layered [X?]", "chromatic scales", "call and response", "rhythmic strumming", "catchy hook", "catchy beat", "instrumental bridge", "sudden dynamics", "pulsing bassline", "pulsing drums", "harmonic chords", "beat drop", "drums intensify", "layered precussion", "layered instrumentals", "Pizzicato", "instrumental bridge", "slow tempo", "minor key", "syncopated bass"]
tempoArr = ["125 BPM", "160 BPM", "112 BPM", "185 BPM", "mid tempo", "slow tempo", "fast tempo"]

# this is used on every paradigm in order to get the style, instruments, and mood related to it
#  keyword is the string relating to the paradigm, which should be available by the triggering conditional within the main loop logic
#  keyword is only used for display purposes here
#  the list_of_arrays is whatever data array goes along with the paradigmn selected
#  expects the regular pattern : styles, instruments, mood.
#  one style, 2 instruments, and 1 mood get selected.
def get_sub_arr_items(keyword, list_of_arrays):
    item1 = random.choice(list_of_arrays[0])
    # we're shuffling and popping to get 2 unique items, randomizing the order then removing with pop
    random.shuffle(list_of_arrays[1])
    potatoArr = []
    for x in list_of_arrays[1]:
        potatoArr.append(x)
    item2 = potatoArr.pop()
    item2 += (", " + potatoArr.pop())
    item3 = random.choice(list_of_arrays[2])
    # Technique and tempo are global and the same for all paradigmns, so they don't need anything passed to them
    item4 = random.choice(techniqueArr)
    item5 = random.choice(tempoArr)
    print(f"Items for {keyword}: \n> {item1}, {item2}, {item3}, {item4}, {item5}")

def get_info_set(keyword):
    if (keyword == "trap"):
        get_sub_arr_items(keyword, trapDataArr)
    elif (keyword == "synthwave_or_eighties"):
        get_sub_arr_items(keyword, eightiesDataArr)
    elif (keyword == "Electro Swing"):
        get_sub_arr_items(keyword, electroSwingDataArr)
    elif (keyword == "jazz"):
        get_sub_arr_items(keyword, jazzDataArr)
    else:
        print("unrecognized keyword for getting the info set Err:001")

while True: 
    print("""Available paradigmns: 
        - [r]andom
        - [j]azz
        - [e]lectro swing
        - [s]ynthwave / eighty's
        - [t]rap / hip-hop
          """)
    userInput = input(" >> ")
    print(f"-" * 42)
    if (userInput.lower() == "r"):
        keyFromInput = random.choice(paradigmnArr)
        print(f"chosen paradigm: {keyFromInput}")
        get_info_set(keyFromInput)
    elif (userInput.lower() == "j"):
        keyFromInput = "jazz"
        get_info_set(keyFromInput)
    elif (userInput.lower() == "e"):
        keyFromInput = "Electro Swing"
        get_info_set(keyFromInput)
    elif (userInput.lower() == "s"):
        keyFromInput = "synthwave_or_eighties"
        get_info_set(keyFromInput)
    elif (userInput.lower() == "t"):
        keyFromInput = "trap"
        get_info_set(keyFromInput)
    continueVar = input("(pausing, [enter] to continue a new loop or e[x]it)")
    if (continueVar.lower() == "x"):
        break
    print(f"/" * 42)

    print("Thank you for using the program. \n Exiting selector program")
