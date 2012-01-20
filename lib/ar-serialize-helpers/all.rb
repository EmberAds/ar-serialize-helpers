Dir[File.dirname(__FILE__) + "/*.rb"].each do |f|
  require f unless f =~ /(all|version)\.rb\z/
end
