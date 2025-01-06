# Arrays
$styleSource = @("animal", "tool", "fruit")
# note: the arrays are very different categories so there is no ambiguity
$animalsArr = @("owl", "fox", "hawk", "wolf", "bear", "tiger", "lion", "alligator")
$toolsArr = @("shovel", "drill", "chisel", "crowbar", "hammer", "screwdriver", "wrench", "rake", "trowel", "saw")
$fruitsArr = @("strawberry", "apple", "blueberry", "cherry", "kiwi", "mango", "plum", "blackberry", "pineapple")

# Function to select a random element from an array
function Select-RandomElement {
    param (
        [array]$array
    )
    return $array | Get-Random
}

# Select a random item from the styleSource array
$styleKeyword = Select-RandomElement -array $styleSource

# Select a random item from the corresponding array based on $styleKeyword
switch ($styleKeyword) {
    "animal" {
        $item1 = Select-RandomElement -array $animalsArr
    }
    "tool" {
        $item1 = Select-RandomElement -array $toolsArr
    }
    "fruit" {
        $item1 = Select-RandomElement -array $fruitsArr
    }
}

# Output the result
Write-Output "$styleKeyword, $item1"
