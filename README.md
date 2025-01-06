# PowershellPlaygroundPlusBash
mostly powershell silly scripts, learning the language but documenting projects

Included projects
# horror word randomizer (in .bash and .ps1) <br/>
    These are mostly the same, except for adding more words to the ps1 version. It's not perfect in making grammatical strings, and is more of a concept thing than a functional program. Demonstrates how to use conditionals in interesting ways
# musicGetter <br/>
      First iteration of a music-keyword generator, focusing on instrument-classes
      (from my commented code notes):
       - word 1 = lead instrument, always
       - word 2 = lead instrument or secondary insturment
       - words 3 & 4 = each have 50% chance to be either mood or style.
       - word 5 = 60% chance for a technical
       - word 6 = always a wild item
     The associated arrays for each class of word are easy to add o 

Project set 1 *Dependent Arrays*
OVERVIEW: meant to be classroom-lessons breaking down ideas into participation-ready exercises, demonstrating how to actually use code.
#  1_dependentArrays (starting with simple categories) <br/>
    introduces basic selection of a second array based on random results of selecting from a first array, chaining together logic
TEACHING NOTES FOR 1_dependentArrays
  -  explain categories as the source array, serving as the first one
(Set a rule that both the categories and items must be very distinct! I've had students argue over the definitions of if a watermelon is a fruit or vegetable, and that doesn't help the class run smoothly)
  -  ask students for example items from each category
  -  come up with a new category, and an associeted bunch of items (my go-to is fantasy monsters, like dragons and unicorns)
  -  add the new keyword to the source array, and construct the new array of keywords for it
  -  show how you can comment out another array if you don't like it, and save a note of a deleted keyword too (show modifying the code with comments)

#  2_dependentArrays (music styles and switch-cases) <br/>
  !NOTE this example code is bulky, and should be cut down before classroom use.
  -  explain main goal for the logic between how we select 2 items from one arr, or one item from 2 arrs by getting 2 source arrays.
  -  show switch cases, and explain differences for why we need the array or why we don't.
  -  use the Write-Output messages to show where logic is being executed in conditional processing
 !NOTE: for classroom use, should have a commented line that will likely trigger repeat items, so that we can see the do-while loop shuffling for a different instrument if they hit the same; currently, this is not very likely.
