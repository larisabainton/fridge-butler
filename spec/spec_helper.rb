# This file was generated by the `rails generate rspec:install` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause
# this file to always be loaded, without a need to explicitly require it in any
# files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need
# it.
#
# The `.rspec` file also contains a few flags that are not defaults but that
# users commonly want.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
require 'coveralls'
require 'vcr'
Coveralls.wear!('rails')

# WebMock.disable_net_connect!(allow_localhost: true)

json = "{
count: 30,
recipes: [
{
publisher: \"Closet Cooking\",
f2f_url: \"http://food2fork.com/view/35120\",
title: \"Bacon Wrapped Jalapeno Popper Stuffed Chicken\",
source_url: \"http://www.closetcooking.com/2012/11/bacon-wrapped-jalapeno-popper-stuffed.html\",
recipe_id: \"35120\",
image_url: \"http://static.food2fork.com/Bacon2BWrapped2BJalapeno2BPopper2BStuffed2BChicken2B5002B5909939b0e65.jpg\",
social_rank: 100,
publisher_url: \"http://closetcooking.com\"
},
{
publisher: \"Closet Cooking\",
f2f_url: \"http://food2fork.com/view/35169\",
title: \"Buffalo Chicken Chowder\",
source_url: \"http://www.closetcooking.com/2011/11/buffalo-chicken-chowder.html\",
recipe_id: \"35169\",
image_url: \"http://static.food2fork.com/Buffalo2BChicken2BChowder2B5002B0075c131caa8.jpg\",
social_rank: 100,
publisher_url: \"http://closetcooking.com\"
},
{
publisher: \"All Recipes\",
f2f_url: \"http://food2fork.com/view/34889\",
title: \"Zesty Slow Cooker Chicken Barbeque\",
source_url: \"http://allrecipes.com/Recipe/Zesty-Slow-Cooker-Chicken-Barbecue/Detail.aspx\",
recipe_id: \"34889\",
image_url: \"http://static.food2fork.com/4515542dbb.jpg\",
social_rank: 100,
publisher_url: \"http://allrecipes.com\"
},
{
publisher: \"The Pioneer Woman\",
f2f_url: \"http://food2fork.com/view/46906\",
title: \"Roast Chicken\",
source_url: \"http://thepioneerwoman.com/cooking/2012/08/roast-chicken/\",
recipe_id: \"46906\",
image_url: \"http://static.food2fork.com/roastchicken2feab.jpg\",
social_rank: 100,
publisher_url: \"http://thepioneerwoman.com\"
},
{
publisher: \"The Pioneer Woman\",
f2f_url: \"http://food2fork.com/view/46996\",
title: \"Cajun Chicken Pasta\",
source_url: \"http://thepioneerwoman.com/cooking/2011/09/cajun-chicken-pasta/\",
recipe_id: \"46996\",
image_url: \"http://static.food2fork.com/cajun0676.jpg\",
social_rank: 100,
publisher_url: \"http://thepioneerwoman.com\"
},
{
publisher: \"The Pioneer Woman\",
f2f_url: \"http://food2fork.com/view/47194\",
title: \"Chicken Parmigiana\",
source_url: \"http://thepioneerwoman.com/cooking/2009/10/chicken-parmigiana/\",
recipe_id: \"47194\",
image_url: \"http://static.food2fork.com/4024225151_5f477f16caabf9.jpg\",
social_rank: 100,
publisher_url: \"http://thepioneerwoman.com\"
},
{
publisher: \"Healthy Delicious\",
f2f_url: \"http://food2fork.com/view/0c2e90\",
title: \"Baked Chicken and Spinach Flautas\",
source_url: \"http://www.healthy-delicious.com/2012/03/baked-chicken-and-spinach-flautas/\",
recipe_id: \"0c2e90\",
image_url: \"http://static.food2fork.com/205xNxchickenandspinachflautas2296f.jpg.pagespeed.ic.RNEW9wsRU.jpg\",
social_rank: 100,
publisher_url: \"http://www.healthy-delicious.com\"
},
{
publisher: \"The Pioneer Woman\",
f2f_url: \"http://food2fork.com/view/47064\",
title: \"Chicken Tortilla Soup\",
source_url: \"http://thepioneerwoman.com/cooking/2011/01/chicken-tortilla-soup/\",
recipe_id: \"47064\",
image_url: \"http://static.food2fork.com/5337400468_d5892f3a03_od5cd.jpg\",
social_rank: 99.99999999999994,
publisher_url: \"http://thepioneerwoman.com\"
},
{
publisher: \"Cookin Canuck\",
f2f_url: \"http://food2fork.com/view/ed141a\",
title: \"Home\",
source_url: \"http://www.cookincanuck.com/2011/11/hearty-chicken-stew-with-butternut-squash-quinoa-recipe/\",
recipe_id: \"ed141a\",
image_url: \"http://static.food2fork.com/ButternutQuinoaStewSquareSmallbe3b.jpg\",
social_rank: 99.99999999999201,
publisher_url: \"http://www.cookincanuck.com\"
},
{
publisher: \"The Pioneer Woman\",
f2f_url: \"http://food2fork.com/view/46982\",
title: \"Broccoli Cheese Soup\",
source_url: \"http://thepioneerwoman.com/cooking/2011/11/broccoli-cheese-soup/\",
recipe_id: \"46982\",
image_url: \"http://static.food2fork.com/broccolicf92.jpg\",
social_rank: 99.99999999999993,
publisher_url: \"http://thepioneerwoman.com\"
},
{
publisher: \"The Pioneer Woman\",
f2f_url: \"http://food2fork.com/view/47070\",
title: \"Chicken and Dumplings\",
source_url: \"http://thepioneerwoman.com/cooking/2010/12/chicken-and-dumplings/\",
recipe_id: \"47070\",
image_url: \"http://static.food2fork.com/5258969545_eeb0c35356_o7eee.jpg\",
social_rank: 99.99999999999993,
publisher_url: \"http://thepioneerwoman.com\"
},
{
publisher: \"All Recipes\",
f2f_url: \"http://food2fork.com/view/28924\",
title: \"Slow Cooker Chicken Taco Soup\",
source_url: \"http://allrecipes.com/Recipe/Slow-Cooker-Chicken-Taco-Soup/Detail.aspx\",
recipe_id: \"28924\",
image_url: \"http://static.food2fork.com/9843414ab7.jpg\",
social_rank: 99.99999999999945,
publisher_url: \"http://allrecipes.com\"
},
{
publisher: \"The Pioneer Woman\",
f2f_url: \"http://food2fork.com/view/46947\",
title: \"Chicken with Mustard Cream Sauce\",
source_url: \"http://thepioneerwoman.com/cooking/2012/02/chicken-with-mustard-cream-sauce/\",
recipe_id: \"46947\",
image_url: \"http://static.food2fork.com/chickenmustarde587.jpg\",
social_rank: 99.99999999999929,
publisher_url: \"http://thepioneerwoman.com\"
},
{
publisher: \"All Recipes\",
f2f_url: \"http://food2fork.com/view/34810\",
title: \"Yummy Honey Chicken Kabobs\",
source_url: \"http://allrecipes.com/Recipe/Yummy-Honey-Chicken-Kabobs/Detail.aspx\",
recipe_id: \"34810\",
image_url: \"http://static.food2fork.com/1184378c8a.jpg\",
social_rank: 99.9999999999988,
publisher_url: \"http://allrecipes.com\"
},
{
publisher: \"All Recipes\",
f2f_url: \"http://food2fork.com/view/4500\",
title: \"Braised Balsamic Chicken\",
source_url: \"http://allrecipes.com/Recipe/Braised-Balsamic-Chicken/Detail.aspx\",
recipe_id: \"4500\",
image_url: \"http://static.food2fork.com/532125a2ff.jpg\",
social_rank: 99.99999999999856,
publisher_url: \"http://allrecipes.com\"
},
{
publisher: \"All Recipes\",
f2f_url: \"http://food2fork.com/view/2495\",
title: \"Baked Honey Mustard Chicken\",
source_url: \"http://allrecipes.com/Recipe/Baked-Honey-Mustard-Chicken/Detail.aspx\",
recipe_id: \"2495\",
image_url: \"http://static.food2fork.com/2334b48b.jpg\",
social_rank: 99.99999999999491,
publisher_url: \"http://allrecipes.com\"
},
{
publisher: \"The Pioneer Woman\",
f2f_url: \"http://food2fork.com/view/47264\",
title: \"Ranch Style Chicken\",
source_url: \"http://thepioneerwoman.com/cooking/2009/01/ranch-style-chicken/\",
recipe_id: \"47264\",
image_url: \"http://static.food2fork.com/3214830317_3470607769fad0.jpg\",
social_rank: 99.99999999999457,
publisher_url: \"http://thepioneerwoman.com\"
},
{
publisher: \"The Pioneer Woman\",
f2f_url: \"http://food2fork.com/view/47167\",
title: \"Homemade Chicken and Noodles\",
source_url: \"http://thepioneerwoman.com/cooking/2010/01/homemade-chicken-and-noodles/\",
recipe_id: \"47167\",
image_url: \"http://static.food2fork.com/4302390134_8a04478597_oc153.jpg\",
social_rank: 99.99999999999358,
publisher_url: \"http://thepioneerwoman.com\"
},
{
publisher: \"Closet Cooking\",
f2f_url: \"http://food2fork.com/view/35168\",
title: \"Buffalo Chicken Chili\",
source_url: \"http://www.closetcooking.com/2012/04/buffalo-chicken-chili.html\",
recipe_id: \"35168\",
image_url: \"http://static.food2fork.com/Buffalo2BChicken2BChili2B5002B9548b7d71737.jpg\",
social_rank: 99.99999999999191,
publisher_url: \"http://closetcooking.com\"
},
{
publisher: \"What's Gaby Cooking\",
f2f_url: \"http://food2fork.com/view/9eb23b\",
title: \"Cheddar Jalapeno Chicken Burgers with Guacamole\",
source_url: \"http://whatsgabycooking.com/cheddar-jalapeno-chicken-burgers-with-guacamole/\",
recipe_id: \"9eb23b\",
image_url: \"http://static.food2fork.com/CheddarJalapenoChickenBurgerswithGuacamole4fdb.jpg\",
social_rank: 99.99999999998766,
publisher_url: \"http://whatsgabycooking.com\"
},
{
publisher: \"The Pioneer Woman\",
f2f_url: \"http://food2fork.com/view/46933\",
title: \"Chicken Florentine Pasta\",
source_url: \"http://thepioneerwoman.com/cooking/2012/04/chicken-florentine-pasta/\",
recipe_id: \"46933\",
image_url: \"http://static.food2fork.com/florentineebc6.jpg\",
social_rank: 99.9999999999312,
publisher_url: \"http://thepioneerwoman.com\"
},
{
publisher: \"The Pioneer Woman\",
f2f_url: \"http://food2fork.com/view/46882\",
title: \"Bowtie Chicken Alfredo\",
source_url: \"http://thepioneerwoman.com/cooking/2012/12/bowtie-chicken-alfredo/\",
recipe_id: \"46882\",
image_url: \"http://static.food2fork.com/chickenalfredoc9c5.jpg\",
social_rank: 99.99999999993057,
publisher_url: \"http://thepioneerwoman.com\"
},
{
publisher: \"The Pioneer Woman\",
f2f_url: \"http://food2fork.com/view/46980\",
title: \"Pork Roast with Apples and Onions\",
source_url: \"http://thepioneerwoman.com/cooking/2011/11/pork-roast-with-apples-and-onions/\",
recipe_id: \"46980\",
image_url: \"http://static.food2fork.com/porkroastapplese1e2.jpg\",
social_rank: 99.99999999991239,
publisher_url: \"http://thepioneerwoman.com\"
},
{
publisher: \"Jamie Oliver\",
f2f_url: \"http://food2fork.com/view/aad814\",
title: \"Perfect roast chicken\",
source_url: \"http://www.jamieoliver.com/recipes/chicken-recipes/perfect-roast-chicken\",
recipe_id: \"aad814\",
image_url: \"http://static.food2fork.com/390_1_1350903747_lrg0b42.jpg\",
social_rank: 99.999999999897,
publisher_url: \"http://www.jamieoliver.com\"
},
{
publisher: \"Closet Cooking\",
f2f_url: \"http://food2fork.com/view/35629\",
title: \"Tequila Lime Grilled Chicken Club Sandwich with Guacamole and Roasted Jalapeno Mayo\",
source_url: \"http://www.closetcooking.com/2012/05/tequila-lime-grilled-chicken-club.html\",
recipe_id: \"35629\",
image_url: \"http://static.food2fork.com/Tequila2BLime2BGrilled2BChicken2BClub2BSandwich2Bwith2BGuacamole2Band2BRoasted2BJalapeno2BMayo2B5002B0617b8b60d15.jpg\",
social_rank: 99.9999999997356,
publisher_url: \"http://closetcooking.com\"
},
{
publisher: \"The Pioneer Woman\",
f2f_url: \"http://food2fork.com/view/46979\",
title: \"Pumpkin Soup\",
source_url: \"http://thepioneerwoman.com/cooking/2011/11/pumpkin-soup/\",
recipe_id: \"46979\",
image_url: \"http://static.food2fork.com/punkin3f44.jpg\",
social_rank: 99.99999999972584,
publisher_url: \"http://thepioneerwoman.com\"
},
{
publisher: \"Simply Recipes\",
f2f_url: \"http://food2fork.com/view/36043\",
title: \"Classic Baked Chicken\",
source_url: \"http://www.simplyrecipes.com/recipes/classic_baked_chicken/\",
recipe_id: \"36043\",
image_url: \"http://static.food2fork.com/bakedchickenc300x2002b69c2e8.jpg\",
social_rank: 99.99999999969124,
publisher_url: \"http://simplyrecipes.com\"
},
{
publisher: \"The Pioneer Woman\",
f2f_url: \"http://food2fork.com/view/2fdcab\",
title: \"Pastor Ryan’s Chicken Tikka Masala\",
source_url: \"http://thepioneerwoman.com/cooking/2009/06/chicken-tikka-masala-by-pastor-ryan/\",
recipe_id: \"2fdcab\",
image_url: \"http://static.food2fork.com/chickentikkamasalac65c.jpg\",
social_rank: 99.99999999945585,
publisher_url: \"http://thepioneerwoman.com\"
},
{
publisher: \"Picky Palate\",
f2f_url: \"http://food2fork.com/view/484d98\",
title: \"Crock Pot Pesto Ranch Chicken Thighs\",
source_url: \"http://picky-palate.com/2012/09/20/pesto-ranch-crock-pot-chicken-thighs/\",
recipe_id: \"484d98\",
image_url: \"http://static.food2fork.com/CrockPotPestoRanchChickenThighs1text1300x248ca0b.jpg\",
social_rank: 99.99999999941502,
publisher_url: \"http://picky-palate.com\"
},
{
publisher: \"All Recipes\",
f2f_url: \"http://food2fork.com/view/26851\",
title: \"Roast Sticky Chicken Rotisserie Style\",
source_url: \"http://allrecipes.com/Recipe/Roast-Sticky-Chicken-Rotisserie-Style/Detail.aspx\",
recipe_id: \"26851\",
image_url: \"http://static.food2fork.com/464580296.jpg\",
social_rank: 99.99999999899647,
publisher_url: \"http://allrecipes.com\"
}
]
}"

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # config.include UserSignInHelper
  config.shared_context_metadata_behavior = :apply_to_host_groups

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  # This option will default to `:apply_to_host_groups` in RSpec 4 (and will
  # have no way to turn it off -- the option exists only for backwards
  # compatibility in RSpec 3). It causes shared context metadata to be
  # inherited by the metadata hash of host groups and examples, rather than
  # triggering implicit auto-inclusion in groups with matching metadata.
  config.shared_context_metadata_behavior = :apply_to_host_groups

  # config.before(:each) do
  #   stub_request(:get, "http://food2fork.com/api/search").
  #     with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
  #     to_return(status: 200, body: json, headers: {})
  #   end
  # end


# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # This allows you to limit a spec run to individual examples or groups
  # you care about by tagging them with `:focus` metadata. When nothing
  # is tagged with `:focus`, all examples get run. RSpec also provides
  # aliases for `it`, `describe`, and `context` that include `:focus`
  # metadata: `fit`, `fdescribe` and `fcontext`, respectively.
  config.filter_run_when_matching :focus

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  #   - http://rspec.info/blog/2012/06/rspecs-new-expectation-syntax/
  #   - http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://rspec.info/blog/2014/05/notable-changes-in-rspec-3/#zero-monkey-patching-mode
  config.disable_monkey_patching!

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end
end
