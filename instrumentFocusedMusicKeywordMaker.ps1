#  NYI re-arrange things with selecting a style first
#       Chance to select a second one with fusion
#  different arrays based on different lead instruments associated with that genre
#  -- make sure to select 2 unique instruments
#       a second style is selectd, 1 instrument from each array.
#  - mood and technical have 50% chance to spawn each
#  - then have students practice implementing the wild array to always select 1, as a challenge that you've already demonstrated.
#  - expand to make an add-on specific to different styles like "hip hip additional", or "retro game music additional"
#    - have students practice implementation of searching if X is in Y array with -contains

#  word 1 = lead instrument, always
# word 2 = lead instrument or secondary insturment
#  word4 & 4 = each have 50% chance to be either mood or style.
# word 5 = 60% chance for a technical
# word 6 = always a wild item

# Arrays of words themed around HP Lovecraft horror novels
$leadInstrument = @("violin", "accordion", "pipe organ", "harpsichord", "mandolin", "bass guitar", "electric guitar", "piano", "acoustic guitar", "saxophone", "synth pads")
$secondInstrument = @("marimba", "orchestral", "bongos", "electric drum pads", "drum kit", "heavy drum beats", "snare drum")
$styles = @("chiptune", "spy music", "thriller soundtrack", "80's action movie soundtrack", "retro game music", "opera", "arabic scales", "latin folk music", "Mexican folk music", "synthwave", "J pop", "J rock", "anime soundtrack", "trance", "progressive house", "nu dsico", "future garage", "chillstep")
$moods = @("intense", "relaxing", "running music", "workout music", "reflective", "aggressive", "atmospheric", "dreamy", "hopeful", "energetic", "sad", "horror", "funky")
$technical = @("harmonic chords", "beat drop", "drums intensify", "layered precussion", "layered instrumentals", "Pizzicato", "instrumental bridge", "slow tempo", "minor key", "syncopated bass")
$wild = @("Suspended Notes", "drone tones", "air horn sound effect", "sirens", "whip sound effect", "sword sound effect", "clap precussion")

# busted/doesn't work as a keyword: gunshots sound effect

# Function to select a random element from an array
function Select-RandomElement {
    param (
        [array]$array
    )
    return $array | Get-Random
}

# Function to decide based on a percentage chance
function Chance {
    param (
        [int]$percent
    )
    return (Get-Random -Minimum 0 -Maximum 100) -lt $percent
}

# Decide if first 2 are lead instruments based on 40% chance for 2 leads and no backup
if (Chance 40) {
    # Assign word1 a random lead instrument
    $word1 = Select-RandomElement -array $leadInstrument
    
    # Assign word2 a different random lead instrument
    do {
        $word2 = Select-RandomElement -array $leadInstrument
    } while ($word1 -eq $word2)
} else {
    # Assign only 1 lead instrument
    $word1 = Select-RandomElement -array $leadInstrument
    $word2 = $null
}

# If word2 was not set yet select a secondary instrument
if (-not $word2) {
    $word2 = Select-RandomElement -array $secondInstrument
}

# Word 3 and 4 share the same logic for a 50/50 at getting a style/mood (generated before Word 3): 40% adjective, 30% present-tense verb, 30% -ing verb
if (Chance 50) {
    $word3 = Select-RandomElement -array $styles
} else {
    $word3 = Select-RandomElement -array $moods
}
# ... same idea for word 4
if (Chance 50) {
    $word4 = Select-RandomElement -array $styles
} else {
    $word4 = Select-RandomElement -array $moods
}

# 50% chance to select a technical aspect for word5
if (Chance 50) {
    $word5 = Select-RandomElement -array $technical
}
#  Note: no "else" because word 5 is not always set

# Word 5: Always a noun, with a 60% chance of appending an adjective if Word 4 is a verb
$word6 = Select-RandomElement -array $wild


# Generate the final string
#  word5 might not exist becasue theres a 50% chance not to set it
if ($word5) {
    $finalString = "$word1, $word2, $word3, $word4, $word5, $word6"
} else {
#  will run if there's no $word5
# exclude word5 if it was not set
    $finalString = "$word1, $word2, $word3, $word4, $word6"
}
Write-Output "Overall suggestion: $finalString"
