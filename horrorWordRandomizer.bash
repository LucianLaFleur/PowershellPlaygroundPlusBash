#!/bin/bash

# Arrays of words themed around HP Lovecraft horror novels
nouns=("tentacle" "abyss" "monolith" "shoggoth" "whisper" "nightmare" "idol" "ritual" "madness" "cult")
present_tense_verbs=("lurks" "screams" "summons" "haunts" "devours" "corrupts" "emerges" "shudders" "echoes" "gazes")
ing_verbs=("lurking" "screaming" "summoning" "haunting" "devouring" "corrupting" "emerging" "shuddering" "echoing" "gazing")
past_tense_verbs=("lurked" "screamed" "summoned" "haunted" "devoured" "corrupted" "emerged" "shuddered" "echoed" "gazed")
prepositions=("in" "at" "by" "under" "over" "through" "among" "against" "within" "beyond")
adjectives=("eldritch" "ancient" "maddening" "unholy" "ominous" "sinister" "cosmic" "malignant" "dark" "mystic")

# Function to select a random element from an array
select_random() {
  local array=("$@")
  echo "${array[RANDOM % ${#array[@]}]}"
}

# Function to decide based on a percentage chance
chance() {
  local percent=$1
  (( RANDOM % 100 < percent ))
}

# Word 1: 60% verb, 40% noun
if chance 60; then
  if chance 50; then
    word1=$(select_random "${ing_verbs[@]}")
  else
    word1=$(select_random "${past_tense_verbs[@]}")
  fi
else
  word1=$(select_random "${nouns[@]}")
fi

# Word 2: 61% preposition, 39% present-tense verb
if chance 61; then
  word2=$(select_random "${prepositions[@]}")
else
  word2=$(select_random "${present_tense_verbs[@]}")
fi

# Word 4 (generated before Word 3): 40% adjective, 30% present-tense verb, 30% -ing verb
if chance 40; then
  word4=$(select_random "${adjectives[@]}")
elif chance 50; then
  word4=$(select_random "${present_tense_verbs[@]}")
else
  word4=$(select_random "${ing_verbs[@]}")
fi

# Word 3: "the" 50% or "a/an" 50%
if chance 50; then
  word3="the"
else
  if [[ $word4 =~ ^[aeiouAEIOU] ]]; then
    word3="an"
  else
    word3="a"
  fi
fi

# Word 5: Always a noun, with a 60% chance of appending an adjective if Word 4 is a verb
word5=$(select_random "${nouns[@]}")
if [[ " ${present_tense_verbs[*]} ${ing_verbs[*]} " == *" $word4 "* ]] && chance 60; then
  word5="$(select_random "${adjectives[@]}") $word5"
fi

# Generate the final string
final_string="$word1 $word2 $word3 $word4 $word5"
echo "Generated String: $final_string"
