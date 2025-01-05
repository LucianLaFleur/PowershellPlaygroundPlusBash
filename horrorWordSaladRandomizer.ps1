# NOTE: because I've actually played with this one, it's a litle more developed than the .bash version
# Arrays of words themed around HP Lovecraft horror novels
$nouns = @("temple", "castle", "harbor", "mansion", "warehouse", "shore", "cliff", "dock", "sailboat", "steam-ship", "tentacle", "equinox", "solstace", "ritual", "creature", "lunatic", "monstrosity", "murderer", "criminal", "abyss", "obelisk", "fish", "monolith", "slime", "relic", "crypt", "phantasm", "oracle", "tome", "daemon", "specter", "fissure", "oblivion", "ruin", "whisper", "nightmare", "idol", "ritual", "madness", "cult", "mask", "altar", "ghost", "monster", "leviathan", "mystery", "secret")
$presentTenseVerbs = @("lurks", "screams", "summons", "haunts", "consumes", "bellows", "devours", "corrupts", "emerges", "shudders", "echoes", "gazes", "uncovers", "explores", "entices", "whispers", "conjures", "decays", "lurks", "vanishes", "dwells", "chills", "taints", "awakens", "stalks")
$ingVerbs = @("lurking", "screaming", "summoning", "haunting", "devouring", "corrupting", "emerging", "shuddering", "echoing", "gazing", "decaying", "rotting", "chilling", "unsettling", "whispering", "conjuring", "decaying", "lurking", "vanishing", "dwelling", "chilling", "tainting", "awakening", "stalking")
$pastTenseVerbs = @("lurked", "screamed", "summoned", "haunted", "devoured", "corrupted", "emerged", "shuddered", "echoed", "gazed", "uncovered", "decayed", "chilled", "unexplored", "beckoned", "whispered", "conjured", "decayed", "lurked", "vanished", "dwelled", "chilled", "tainted", "awakened", "stalked")
$prepositions = @("in", "on", "within", "at", "by", "from", "with", "under", "over", "through", "among", "against", "across", "beyond")
$adjectives = @("eldritch", "lunar", "morning", "nightly", "smoky", "insane", "quaint", "antique", "diseased", "slimy", "dusty", "forgotten", "ancient", "maddening", "unholy", "ominous", "sinister", "cosmic", "malignant", "dark", "mystic", "muddy", "phantasmagorical", "underwater", "secret")

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

# Word 1: 60% verb, 40% noun
if (Chance 60) {
    if (Chance 50) {
        $word1 = Select-RandomElement -array $ingVerbs
    } else {
        $word1 = Select-RandomElement -array $pastTenseVerbs
    }
    # Attach a random noun to the verb, since this point in the logic indicates a verb got selected
    $word1 += " " + (Select-RandomElement -array $nouns)
} else {
    $word1 = Select-RandomElement -array $nouns
}

# Word 2: 61% preposition, 39% present-tense verb
if (Chance 61) {
    $word2 = Select-RandomElement -array $prepositions
} else {
    $word2 = Select-RandomElement -array $presentTenseVerbs
}

# Word 4 (generated before Word 3): 40% adjective, 30% present-tense verb, 30% -ing verb
if (Chance 40) {
    $word4 = Select-RandomElement -array $adjectives
} elseif (Chance 50) {
    $word4 = Select-RandomElement -array $nouns
} else {
    $word4 = Select-RandomElement -array $ingVerbs
}

# Word 3: "the" 50% or "a/an" 50%
if (Chance 50) {
    $word3 = "the"
} else {
    if ($word4 -cmatch '^[aeiouAEIOU]') {
        $word3 = "an"
    } else {
        $word3 = "a"
    }
}

# Word 5: Always a noun, with a 60% chance of appending an adjective if Word 4 is a verb
$word5 = Select-RandomElement -array $nouns
if ($presentTenseVerbs -contains $word4 -or $ingVerbs -contains $word4) {
    if (Chance 60) {
        $word5 = (Select-RandomElement -array $adjectives) + " " + $word5
    }
}

# Generate the final string
$finalString = "$word1 $word2 $word3 $word4 $word5"
Write-Output "Generated String: $finalString"
