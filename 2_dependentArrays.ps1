# NYI of further refinement into archetypes that allow a set of arrays
#  ex: archetypesArr = ["techno", "rap", "jazz", "synth"]
#  technoStylesArr = ["chiptune", "retro game music", "edm", "trance", "melodic dubstep", "progressive house"]
#  technoInstrumentsArr = ["midi sampling", "synth pads", "synth keyboard", "drum machine", "808 drum kit", "electric bass", "electric guitar", "vocoder", "square wave"]
#  same for jazz and synth

# Arrays
$styleSource = @("witch house", "phonk", "rap", "drill rap", "trap house", "80's pop", "80's techno", "Jazz", "Electro Swing", "oldies", "1920's Jazz", "1950's rock and roll")

# "suspense", "thriller", 
$80sTechnoArr = @("synthesizer", "darksynth", "drum machine", "808 drum kit", "electric bass", "electric guitar", "vocoder", "square wave")
$JazzArr = @("spy music", "humming", "clarinet", "brass band", "orchestra", "electric guitar", "saxophone", "trombone", "trumpet", "double bass", "bongos", "cello", "piano")
$electroSwingArr = @("turntables", "drum set", "clarinet", "brass band", "orchestra", "violin", "synthesizer", "keyboard", "electric guitar", "turntables", "saxophone", "trombone", "trumpet", "double bass", "upright bass", "cello", "piano")
$oldiesRockArr = @("acoustic guitar", "electric guitar", "double bass", "piano", "honky tonk piano", "Tambourine", "harmonica", "bass guitar")
$rapArr = @("kick drum", "808 bass", "orchestral", "brass", "brass orchestra", "snare drum", "hi-hats", "sampler", "bass guitar", "synth bass", "heavy bass")
# make a thing for industrial and opera

# ------
# $unused = @(, "retro game music", "opera", "arabic scales", "latin folk music", "cyberpunk", "darksynth", "J pop", "J rock", 
$moodArr = @("romantic", "sophistocated", "mysterious", "dreamy", "atmospheric", "downtempo", "dark", "ethereal", "intense", "relaxing", "running music", "workout music", "reflective", "aggressive", "atmospheric", "dreamy", "hopeful", "energetic", "sad", "horror", "funky", "chiptune", "spy music", "thriller soundtrack", "80's action movie soundtrack", "deep house", "progressive house", "nu dsico", "future garage")
$techArr = @("catchy beat", "instrumental bridge", "sudden dynamics", "pulsing bassline", "pulsing drums", "harmonic chords", "beat drop", "drums intensify", "layered precussion", "layered instrumentals", "Pizzicato", "instrumental bridge", "slow tempo", "minor key", "syncopated bass")
# $wild = @("Suspended Notes", "drone tones", "air horn sound effect", "sirens", "whip sound effect", "sword sound effect", "clap precussion")
$tempoArr = @("125 BPM", "160 BPM", "112 BPM", "185 BPM", "mid tempo", "slow tempo", "fast tempo")

# random number generation for percentage chance
function Chance {
    param (
        [int]$percent
    )
    return (Get-Random -Minimum 0 -Maximum 100) -lt $percent
}

# Function to select a random element from an array
function Select-RandomElement {
    param (
        [array]$array
    )
    return $array | Get-Random
}

# Select a random item from the styleSource array
$styleKeyword1 = Select-RandomElement -array $styleSource
Write-Output "first style is : $styleKeyword1"
# Select a select a second style at 50% for 2 different styles and 2 different insturments
#  else have just 2 instruments from the same style
if (Chance 50) {
    switch ($styleKeyword1) {
        "witch house" {
            $chosenStyleArr = $80sTechnoArr
            $item1 = Select-RandomElement -array $rapArr
        } 
        "phonk" {
            $chosenStyleArr = $80sTechnoArr
            $item1 = Select-RandomElement -array $rapArr
        } 
        "rap" {
            $chosenStyleArr = $80sTechnoArr
            $item1 = Select-RandomElement -array $rapArr
        } 
        "drill rap" {
            $chosenStyleArr = $80sTechnoArr
            $item1 = Select-RandomElement -array $rapArr
        } 
        "trap house" {
            $chosenStyleArr = $80sTechnoArr
            $item1 = Select-RandomElement -array $rapArr
        }
        "1920's Jazz" {
            $chosenStyleArr = $JazzArr
            $item1 = Select-RandomElement -array $JazzArr
        }
        "oldies" {
            $chosenStyleArr = $oldiesRockArr
            $item1 = Select-RandomElement -array $oldiesRockArr
        }
        "1950's rock and roll" {
            $chosenStyleArr = $oldiesRockArr
            $item1 = Select-RandomElement -array $oldiesRockArr
        }
        "80's techno" {
            $chosenStyleArr = $80sTechnoArr
            $item1 = Select-RandomElement -array $80sTechnoArr
        }
        "80's pop" {
            $chosenStyleArr = $80sTechnoArr
            $item1 = Select-RandomElement -array $80sTechnoArr
        }
        "Jazz" {
            $chosenStyleArr = $JazzArr
            $item1 = Select-RandomElement -array $JazzArr
        }
        "Electro Swing" {
            $chosenStyleArr = $electroSwingArr
            $item1 = Select-RandomElement -array $electroSwingArr
        }
    } 
    Write-Output "For 2 instrumens from same genre, 1st instrument is: $item1"
    # get a random item, and make sure it's not the same as the first instrument selected
    # The chosenStyleArr repeats whichever array was determined by the above switch statement
    do {
        $item2 = Select-RandomElement -array $chosenStyleArr
        Write-Output "rolled (of same): $item2"
    } while ($item1 -eq $item2)
    Write-Output "Both from style [$styleKeyword1] selected: $item1, $item2"
} else {
    switch ($styleKeyword1) {
        "witch house" {
            $item1 = Select-RandomElement -array $rapArr
        } 
        "phonk" {
            $item1 = Select-RandomElement -array $rapArr
        } 
        "rap" {
            $item1 = Select-RandomElement -array $rapArr
        } 
        "drill rap" {
            $item1 = Select-RandomElement -array $rapArr
        } 
        "trap house" {
            $item1 = Select-RandomElement -array $rapArr
        }
        "1920's Jazz" {
            $item1 = Select-RandomElement -array $JazzArr
        }
        "oldies" {
            $item1 = Select-RandomElement -array $oldiesRockArr
        }
        "1950's rock and roll" {
            $item1 = Select-RandomElement -array $oldiesRockArr
        }
        "80's techno" {
            $item1 = Select-RandomElement -array $80sTechnoArr
        } 
        # deliberately mapped to the same arr as techno in 80's
        "80's pop" {
            $item1 = Select-RandomElement -array $80sTechnoArr
        }
        "Jazz" {
            $item1 = Select-RandomElement -array $JazzArr
        }
        "Electro Swing" {
            $item1 = Select-RandomElement -array $electroSwingArr
        }
    } 
    Write-Output "selected first instrument: $item1"
    # set a second styleKeyword if reaching this point, meaning 50% chance to have 2 source styles
    # This will result in 2 styles with 1 instrument from each, non-repeating
    $styleKeyword2 = Select-RandomElement -array $styleSource
    Write-Output "Selected second style: $styleKeyword2"
# Set chosenStyleArr based on switch flipped
    #  Explain that this is important for selecting the second item, but we're setting the item
    #  in the do-while below
    switch ($styleKeyword2) {
        "witch house" {
            $chosenStyleArr = $80sTechnoArr
        } 
        "phonk" {
            $chosenStyleArr = $80sTechnoArr
        } 
        "rap" {
            $chosenStyleArr = $80sTechnoArr
        } 
        "drill rap" {
            $chosenStyleArr = $80sTechnoArr
        } 
        "trap house" {
            $chosenStyleArr = $80sTechnoArr
        }
        "1920's Jazz" {
            $chosenStyleArr = $JazzArr
        }
        "oldies" {
            $chosenStyleArr = $oldiesRockArr
        }
        "1950's rock and roll" {
            $chosenStyleArr = $oldiesRockArr
        }
        "80's techno" {
            $chosenStyleArr = $80sTechnoArr
        }
        "80's pop" {
            $chosenStyleArr = $80sTechnoArr
        }
        "Jazz" {
            $chosenStyleArr = $JazzArr
        }
        "Electro Swing" {
            $chosenStyleArr = $electroSwingArr
        }
    } 
    # Set the item to something unique
    # Need to reference the array so you don't get garbage
    do {
        $item2 = Select-RandomElement -array $chosenStyleArr
        Write-Output "rolled (of different) $item2"
    } while ($item1 -eq $item2)
    Write-Output "$item2 is unique from $item1"
}

$moodString = Select-RandomElement -array $moodArr
$techString = Select-RandomElement -array $techArr
$tempoString = Select-RandomElement -array $tempoArr

# Output the result
if ($styleKeyword2) {
    Write-Output "$styleKeyword1, $styleKeyword2, $item1, $item2, $techString, $moodString, $tempoString"
} else {
    Write-Output "$styleKeyword1, $item1, $item2, $techString, $moodString, $tempoString"
}
