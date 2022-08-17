When(/^the user adds a To-Do list containing (.*), (.*), (.*)$/) do |item1, item2, item3|
  on(AngularToDoPage) do |page|
    page.to_do_list(item1, item2, item3)
  end
end

Then(/^the To-Do list will contain (.*)$/) do |items|
  on(AngularToDoPage) do |page|
    # Utilizes RSpec Expectations to verify the values exist in the list
    # https://github.com/rspec/rspec-expectations
    #
    # Takes all 3 items passed in (or any number) and splits them into an array
    # to use the assertion on any number of items passed in.
    items.split(', ').each do |item|
      Watir::Wait.until { page.entry(item).exists? }
      expect(page.entry(item).exist?).to be true
    end
  end
end

And(/^the user completes the To-Do list$/) do
  on(AngularToDoPage) do |page|
    page.complete_entire_to_do
  end
end

Then(/^the list will be confirmed to be completed$/) do
  on(AngularToDoPage) do |page|
    # When the list is complete the page will display '0 items left'.
    #
    # This takes the first character for the 'items left' element
    # and converts it to an integer. Then does an assertion to
    # verify that the number is 0, indicating that the list is complete.
    number = page.item_count[0].to_i
    expect(number).to be 0
    expect(number).not_to be > 0
  end
end

And(/^the user deletes (.*) from the list$/) do |item|
  on(AngularToDoPage) do |page|
    page.delete_item(item).click
  end
end

Then(/^(.*) will not appear in the list$/) do |item|
  on(AngularToDoPage) do |page|
    expect(page.entry(item).exist?).to be false
  end
end

And(/^the user completes (.*) from the list$/) do |item|
  on(AngularToDoPage) do |page|
    page.complete_to_do(item)
  end
end

Then(/^(.*) will be marked as complete in the list$/) do |item|
  on(AngularToDoPage) do |page|
    expect(page.completed_entry(item).exist?).to be true
  end
end
