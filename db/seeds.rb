# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

beer_styles = [
  ["American Amber / Red Ale", "No description provided."],
  ["American Barleywine", "No description provided."],
  ["American Black Ale", "No description provided."],
  ["American Blonde Ale", "No description provided."],
  ["American Brown Ale", "No description provided."],
  ["American Dark Wheat Ale", "No description provided."],
  ["American Double / Imperial IPA", "No description provided."],
  ["American Double / Imperial Stout", "No description provided."],
  ["American IPA", "No description provided."],
  ["American Pale Ale (APA)", "No description provided."],
  ["American Pale Wheat Ale", "No description provided."],
  ["American Porter", "No description provided."],
  ["American Stout", "No description provided."],
  ["American Strong Ale", "No description provided."],
  ["American Wild Ale", "No description provided."],
  ["Black & Tan", "No description provided."],
  ["Chile Beer", "No description provided."],
  ["Cream Ale", "No description provided."],
  ["Pumpkin Ale", "No description provided."],
  ["Rye Beer", "No description provided."],
  ["Wheatwine", "No description provided."],
  
  ["Belgian Dark Ale", "No description provided."],
  ["Belgian IPA", "No description provided."],
  ["Belgian Pale Ale", "No description provided."],
  ["Belgian Strong Dark Ale", "No description provided."],
  ["Belgian Strong Pale Ale", "No description provided."],
  ["Bière de Champagne / Bière Brut", "No description provided."],
  ["Bière de Garde", "No description provided."],
  ["Dubbel", "No description provided."],
  ["Faro", "No description provided."],
  ["Flanders Oud Bruin", "No description provided."],
  ["Flanders Red Ale", "No description provided."],
  ["Gueuze", "No description provided."],
  ["Lambic - Fruit", "No description provided."],
  ["Lambic - Unblended", "No description provided."],
  ["Quadrupel (Quad)", "No description provided."],
  ["Saison / Farmhouse Ale", "No description provided."],
  ["Tripel", "No description provided."],
  ["Witbier", "No description provided."],
  
  ["Baltic Porter", "No description provided."],
  ["Braggot", "No description provided."],
  ["English Barleywine", "No description provided."],
  ["English Bitter", "No description provided."],
  ["English Brown Ale", "No description provided."],
  ["English Dark Mild Ale", "No description provided."],
  ["English India Pale Ale (IPA)", "No description provided."],
  ["English Pale Ale", "No description provided."],
  ["English Pale Mild Ale", "No description provided."],
  ["English Porter", "No description provided."],
  ["English Stout", "No description provided."],
  ["English Strong Ale", "No description provided."],
  ["Extra Special / Strong Bitter (ESB)", "No description provided."],
  ["Foreign / Export Stout", "No description provided."],
  ["Milk / Sweet Stout", "No description provided."],
  ["Oatmeal Stout", "No description provided."],
  ["Old Ale", "No description provided."],
  ["Russian Imperial Stout", "No description provided."],
  ["Winter Warmer", "No description provided."],
  
  ["Altbier", "No description provided."],
  ["Berliner Weissbier", "No description provided."],
  ["Dunkelweizen", "No description provided."],
  ["Gose", "No description provided."],
  ["Hefeweizen", "No description provided."],
  ["Kölsch", "No description provided."],
  ["Kristalweizen", "No description provided."],
  ["Roggenbier", "No description provided."],
  ["Weizenbock", "No description provided."],
  
  ["Irish Dry Stout", "No description provided."],
  ["Irish Red Ale", "No description provided."],
  
  ["Scotch Ale / Wee Heavy", "No description provided."],
  ["Scottish Ale", "No description provided."],
  ["Scottish Gruit / Ancient Herbed Ale", "No description provided."],
  
  ["American Adjunct Lager", "No description provided."],
  ["American Amber / Red Lager", "No description provided."],
  ["American Double / Imperial Pilsner", "No description provided."],
  ["American Malt Liquor", "No description provided."],
  ["American Pale Lager", "No description provided."],
  ["California Common / Steam Beer", "No description provided."],
  ["Light Lager", "No description provided."],
  ["Low Alcohol Beer", "No description provided."],
  
  ["Czech Pilsener", "No description provided."],
  
  ["Euro Dark Lager", "No description provided."],
  ["Euro Pale Lager", "No description provided."],
  ["Euro Strong Lager", "No description provided."],
  
  ["Bock", "No description provided."],
  ["Doppelbock", "No description provided."],
  ["Dortmunder / Export Lager", "No description provided."],
  ["Eisbock", "No description provided."],
  ["German Pilsener", "No description provided."],
  ["Keller Bier / Zwickel Bier", "No description provided."],
  ["Maibock / Helles Bock", "No description provided."],
  ["Märzen / Oktoberfest", "No description provided."],
  ["Munich Dunkel Lager", "No description provided."],
  ["Munich Helles Lager", "No description provided."],
  ["Rauchbier", "No description provided."],
  ["Schwarzbier", "No description provided."],
  ["Vienna Lager", "No description provided."],
  
  ["Happoshu", "No description provided."],
  ["Japanese Rice Lager", "No description provided."],
  
  ["Fruit / Vegetable Beer", "No description provided."],
  ["Herbed / Spiced Beer", "No description provided."],
  ["Smoked Beer", "No description provided."]
]


beer_styles.each do |name, description|
  BeerStyle.create( name: name, description: description )
end