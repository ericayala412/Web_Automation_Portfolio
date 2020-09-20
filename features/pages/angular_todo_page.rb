# Models out page objects on the Angular To-Do MVC page:
# http://todomvc.com/examples/angular2/
class AngularToDoPage
  include PageObject

  # Identifies the "To-Do" input field on the Angular To-Do MVC page
  def to_do_field
    @browser.input(:class, /new-todo/)
  end

  # Identifies the completed entry and text of an entered To-Do value
  # @param text [String] Uses the text value of the object passed in from the
  # Gherkin table to identify specific entries in the list
  def entry(text)
    @browser.div(class: 'view', text: text)
  end

  # Helper method that will enter elements passed in via a Cucumber
  # example table by iterating over the values and entering them on
  # the list.
  # @param e [Array] Takes an array of objects passed in from the Gherkin step
  # to send_keys and enter their values on the page
  def to_do_list(*e)
    e.each do |entry|
      to_do_field.send_keys entry
      to_do_field.send_keys :enter
    end
  end

  # Helper method that selects all checkboxes on the To-Do page
  def complete_entire_to_do
    @browser.inputs(class: 'toggle', type: 'checkbox').each do |c|
      # This element does not take a typical .click,
      # however using the fire_event method will click the
      # checkbox properly.
      c.fire_event :click
    end
  end

  # Returns the text for "X items left" on the To-Do list
  def item_count
    @browser.span(class: 'todo-count').text
  end

  # Helper method to identify the specific list item on the screen
  # and its associated "X" button to remove it from the list
  # @param text [String]
  def delete_item(text)
    @browser.div(class: 'view', text: text).hover
    @browser.div(class: 'view', text: text).button(class: 'destroy')
  end

  # Helper method that selects all checkboxes on the To-Do page
  # @param item [String] The text of the to-do item you want to check off
  def complete_to_do(item)
    entry(item).checkbox.fire_event :click
  end

  # Method that associates the the "completed" class with a completed list entry.
  # @param text [String] The entry of the item within the the list that is checked off
  def completed_entry(text)
    @browser.li(class: 'completed').label(text: text)
  end

end
