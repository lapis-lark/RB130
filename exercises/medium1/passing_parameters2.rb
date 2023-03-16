def birds_of_prey(arr)
  yield(arr)
end
birds = %w(raven finch hawk eagle)
birds_of_prey(birds) { |_, _, *main_birbs| puts (raptors = main_birbs) }