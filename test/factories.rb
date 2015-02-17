FactoryGirl.define do
  factory :ressource do
    title "Declaration du Cyberespace"
    url "http://editions-hache.com/essais/barlow/barlow2.html"
    lang "en"
    level "green"
    time 10
  end

  factory :chapitre do
    title "foo"
    intro "bar"
    ressources {|ressources| [ressources.association(:ressource)]}
  end
end


