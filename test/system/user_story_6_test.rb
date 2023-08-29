require "application_system_test_case"

class UserStory6Test < ApplicationSystemTestCase

    test 'Home Page has comment box' do
        visit root_path 
        assert_selector '.comment-box', count: 1
    end
    
    test "create a comment and verify its presence" do
        # 1. Generating a Comment
        comment = Comment.create!(day: Date.today, content: "My new comment")
        visit root_path
  
        #Verify
        assert_selector 'div.comment-box', text: "My new comment"
    end

    test "modify an existing comment and verify its update" do
        # 1. Setup: Visit the home page and fill in the original comment
        visit root_path
        
        # Assuming you've already created a comment since the button is "Update Comment"
        within ".comment-box" do
          assert_selector ".comment-textarea" # Make sure textarea exists
          fill_in "comment[content]", with: "Original comment content"
          click_button "Update"
        end
        assert_text "Original comment content" # Ensure the original comment is displayed
    
        # 2. Action: Modify the comment
        within ".comment-box" do
          fill_in "comment[content]", with: "Updated comment content"
          click_button "Update"
        end
    
        #Using this as a delay to avoid testing contents before they have a chance to load
        assert_selector "h1", text: "High Flights Soaring", wait: 15

        # Timing related errors when this is removed.  The wait above does not seem sufficient
        take_screenshot

        # 3. Verification: Verify the updated content
        # Depending on how your page displays comments, you might need to adjust this.
        # Assuming the page reloads and displays the comment in the same comment box:
        within ".comment-box" do
            assert_equal find(".comment-textarea").text, "Updated comment content"
        end
    end

    test "modify an existing comment to an empty string" do
        # 1. Setup: Visit the home page and fill in the original comment
        visit root_path
            
        # Create a comment to start with
        within ".comment-box" do
            fill_in "comment[content]", with: "Original comment content"
            click_button "Update"
        end
        assert_text "Original comment content" # Ensure the original comment is displayed
    
        # 2. Action: Modify the comment to be empty
        within ".comment-box" do
            fill_in "comment[content]", with: ""
            click_button "Update"
        end
    
        #Using this as a delay to avoid testing contents before they have a chance to load
        assert_selector "h1", text: "High Flights Soaring", wait: 15
    
        # Timing related errors when this is removed.  The wait above does not seem sufficient
        take_screenshot
    
        # 3. Verification: Verify the updated content
        # Depending on how your page displays comments, you might need to adjust this.
        # Assuming the page reloads and displays the comment in the same comment box:
        within ".comment-box" do
            assert_equal find(".comment-textarea").text, "" # Verifying the comment is empty
        end
    end 
end
