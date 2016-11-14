Test Suite Archetecture Guidlines: 
(written by CG Acharjya for Roostify)

Under the test_suite folder is a folder with a suite_name folder.  
Seems redundant but moose allows for multiple sub-suites/alternate suites etc.

Under the suite_name folder there will be at minimum a helper folder, a locator folder and a test group folder



Making locators:
First find your element on the page using firebug or inspect element. In a perfect world: If no elements work yell make them set an approrpiate ID for that element. 
Then add the locator to the appropriate file. If there's already one that seems logical add it to that one. Lets keep locator files appropriate, logical and paired down. Its easy to find a locator in one file if the name of the file is easy to identify.

#write new process for angular: 

For Roostify I have decided that currently the groups will be "UI" 

Locator files should reflect these things. EX: ui.yml tells us that it's used in the ui group and for the application test case. these are general guidelines and file names may adjust, but the first part of your yml file name should reflect the overall suite it's in. It can be homeowner_click_all_the_things.yml (have fun typing that one out), or con_sales_find_all_the_bugs.yml. Exceptions are things like "navigation.yml" if there is no suite context it should be something that is universally used. home_page.yml is going to be used everywhere. 



In order to set the locator group for your test case, within the pages folder, make a page (your_page_name.rb) and type this:

def locator_group
      @lg ||= Champ.locator_group_for('your_locator_file_goes_here')
  end 

This file also houses all your pointers to other elements so that we no longer have to write Moose::blablabla every time we want to locate say the contractor form. we can just call the method "contractor_form.click" or some such nonsense (I belive). You can still do that, but this will save us time and keep things simple to read and elegant.

Each test case then gets listed in a yml for the test case suite, then the suite gets listed in a master yml that allows moose to run suites of tests or drill down and only run an individula case. It's been a while, but moose can run headless, run multithreaded (aka many suites or in multiple native browsers in the same space), and spit out the results and with a small command line trigger rerun all the failed tests cases only. There may be extra setup for that, the 8 months I've been away have my memory hazy. 

Wile I want to make it simple as we only have/had an hour, understanding how to future prooof your tests and understanding the need for good archetecture and organization is key in a good SDIT/QAE/QAE Lead. For the purposes of this I'll only do one test and we can write it in native WATIR and discuss what needs testing, but ideally i'd like to follow this archetecture in the future (I belive it doesn't matter the framework as long as it supports true ruby and an actual arcitecture). This exact thing likely won't work for rspec test suites, and rspec doesn't really need it, though if we could only run rspec tests around what logically would be affected that would be ideal :-)






