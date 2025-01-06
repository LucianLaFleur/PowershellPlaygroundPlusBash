mostly powershell scripts, while learning the language but documenting projects along the way

Included projects
<h1> horror word randomizer </h1>(in .bash and .ps1) <br/>
    These are mostly the same, except for adding more words to the ps1 version. It's not perfect in making grammatical strings, and is more of a concept thing than a functional program. Demonstrates how to use conditionals in interesting ways
<h1> musicGetter </h1> <br/>
      First iteration of a music-keyword generator, focusing on instrument-classes
      (from my commented code notes): <br/>
        <br/> - word 1 = lead instrument, always
        <br/> - word 2 = lead instrument or secondary insturment
        <br/> - words 3 & 4 = each have 50% chance to be either mood or style.
        <br/> - word 5 = 60% chance for a technical
        <br/> - word 6 = always a wild item
     The associated arrays for each class of word are easy to add o 

Project set 1 *Dependent Arrays*
OVERVIEW: meant to be classroom-lessons breaking down ideas into participation-ready exercises, demonstrating how to actually use code.
<h1>  1_dependentArrays (starting with simple categories) </h1> <br/>
     <br/> introduces basic selection of a second array based on random results of selecting from a first array, chaining together logic
 <br/> TEACHING NOTES FOR 1_dependentArrays
   <br/> -  explain categories as the source array, serving as the first one
 <br/> (Set a rule that both the categories and items must be very distinct! I've had students argue over the definitions of if a watermelon is a fruit or vegetable, and that doesn't help the class run smoothly)
  <br/>  -  ask students for example items from each category
  <br/>  -  come up with a new category, and an associeted bunch of items (my go-to is fantasy monsters, like dragons and unicorns)
   <br/> -  add the new keyword to the source array, and construct the new array of keywords for it
   <br/> -  show how you can comment out another array if you don't like it, and save a note of a deleted keyword too (show modifying the code with comments)

 <h1> 2_dependentArrays (music styles and switch-cases) </h1> <br/>
   <br/> !NOTE this example code is bulky, and should be cut down before classroom use.
   <br/> -  explain main goal for the logic between how we select 2 items from one arr, or one item from 2 arrs by getting 2 source arrays.
   <br/> -  show switch cases, and explain differences for why we need the array or why we don't.
   <br/> -  use the Write-Output messages to show where logic is being executed in conditional processing
 <br/>  !NOTE: for classroom use, should have a commented line that will likely trigger repeat items, so that we can see the do-while loop shuffling for a different instrument if they hit the same; currently, this is not very likely.

<h1> 3_dependentArrays python paradigmn selection </h1> <br/>
 <br/> NOTE: written in python because of fast prototyping, powershell is not efficient for larger deals when I'm already familiar with other tools; good opportunity to show python and similarities... 
<br/> The goal is to get a string of keywords including a style, 2 non-repeating instruments, a mood, a technique, and a tempo. 
<br/> we want this organization so we can make styles, instruments, moods that apply to one paradigmn, but not necissarily another (ex. It makes sense to have a trumpet in Electro Swing, but not in 80's rock and roll; the generation program I'm plugging keywords into will not make things correctly if it gets keywords that don't make sense with the source data the tensors were trained on, so fusion-ability is limited). We can get around this limitation by grouping sensible styles and instruments together. 
</br> also, not all moods make sense. Like "aggressive lounge music" is kinda insane, and "reflective hip hop" is weird too. Thus we control these 3 categories, [styles, instruments, moods] for each paradigmn listed in a Paradigmn Arr at the top.
<br/>  --- explaining some key functions and logic
 <br/> function  get_info_set() : uses the keywords from the paradigmn array. While these are simple conditionals, it directs the program to understand which sets of data should be handled based on whatever keyword is triggered
 <br/> the function get_sub_arr_items() :  manages the randomization and printing the output that we want
 <br/> the main function While True, will ask for user input, allowing for key-letters to trigger manual selection of a paradigm, and randomize output words. A full random option "r" is allowed, which first selects a random item from the Paradigm Arr, then selects items from the sub arrays thereafter.
 <br/> some print statements are added to allow for better visual "barriers" to make the output more readable.
  <br/> has "continue" functionaliy to make more generations and repeat the loop. As a formality, has an exit option to end the program and leave the loop
